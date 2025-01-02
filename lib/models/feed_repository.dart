import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:webfeed_plus/domain/atom_feed.dart';
import 'package:webfeed_plus/domain/atom_item.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';
import 'package:webfeed_plus/domain/rss_item.dart';

import '../data/data.dart';
import '../util/feeds_database.dart';

enum FeedType {
  rss,
  atom,
}

class FeedRepository {
  // ignore: unused_field
  final Ref _ref;
  const FeedRepository(this._ref);

  static Future<FeedArticle> selectByUrl(url) async {
    final Database db = await FeedableDatabase.database;
    final List<Map<String, dynamic>> maps = await db.transaction(
        (txn) => txn.query('feeds', where: 'url = ?', whereArgs: [url]));

    return FeedArticle(
      maps[0]['title'],
      maps[0]['url'],
      DateTime.parse(maps[0]['publishedDate']),
      maps[0]['blogName'],
      maps[0]['bookmarked'] == '1' ? true : false,
      maps[0]['alreadyRead'] == '1' ? true : false,
    );
  }

  static Future<void> save(FeedArticle feedArticle) async {
    final Database db = await FeedableDatabase.database;
    await db.update(
      'feeds',
      toMap(feedArticle),
      where: "url = ?",
      whereArgs: [feedArticle.url],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static Map<String, dynamic> toMap(FeedArticle feedArticle) => {
        'title': feedArticle.title,
        'url': feedArticle.url,
        'publishedDate': feedArticle.publishedDate.toString(),
        'blogName': feedArticle.blogName,
        'bookmarked': (feedArticle.bookmarked) ? '1' : '0',
        'alreadyRead': (feedArticle.alreadyRead) ? '1' : '0',
      };

  static Future<void> insertFeed(Feed feed) async {
    // ToDo bulk insert
    for (var feedArticle in feed.articleList) {
      insertFeedArticle(feedArticle);
    }
  }

  static Future<void> insertFeedArticle(FeedArticle feedArticle) async {
    final Database db = await FeedableDatabase.database;
    await db.insert(
      'feeds',
      toMap(feedArticle),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  static Future<Feed> selectAll() async {
    final Database db = await FeedableDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('feeds');
    return Feed(
        articleList: List.generate(maps.length, (i) {
      return FeedArticle(
        maps[i]['title'],
        maps[i]['url'],
        DateTime.parse(maps[i]['publishedDate']),
        maps[i]['blogName'],
        maps[i]['bookmarked'] == '1' ? true : false,
        maps[i]['alreadyRead'] == '1' ? true : false,
      );
    }));
  }

  static Future<Feed> selectBookmarkedFeed() async {
    final Database db = await FeedableDatabase.database;
    final List<Map<String, dynamic>> maps =
        await db.query('feeds', where: 'bookmarked = ?', whereArgs: [true]);
    return Feed(
        articleList: List.generate(maps.length, (i) {
      return FeedArticle(
        maps[i]['title'],
        maps[i]['url'],
        DateTime.parse(maps[i]['publishedDate']),
        maps[i]['blogName'],
        maps[i]['bookmarked'] == '1' ? true : false,
        maps[i]['alreadyRead'] == '1' ? true : false,
      );
    }));
  }

  static Future<Feed> getFeed() async {
    Feed feed = await FeedRepository.fetchFeedFromSite();

    // 永続化
    FeedRepository.insertFeed(feed);
    return await FeedRepository.selectAll();
  }

  static Future<Feed> getFeedOrderedByDate() async {
    var feed = await getFeed();
    // 副作用
    feed.articleList
        .sort((a, b) => b.publishedDate!.compareTo(a.publishedDate!));
    return feed;
  }

  static Future<Feed> fetchFeedFromSite() async {
    List<List<FeedArticle>> feedArticles = [];
    await Future.forEach(Sites, (site) async {
      if (site["feedType"]! == "rss") {
        await _fetchArticleFromSite(site["url"]!, FeedType.rss).then((value) {
          feedArticles.add(value);
        });
      } else {
        await _fetchArticleFromSite(site["url"]!, FeedType.atom).then((value) {
          feedArticles.add(value);
        });
      }
    });
    return Feed(articleList: feedArticles.expand((v) => v).toList());
  }

  static Future<List<FeedArticle>> _fetchArticleFromSite(
      String url, FeedType type) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to getFeed');
    }
    if (type == FeedType.rss) {
      final rssFeed = RssFeed.parse(response.body);
      final rssItems = rssFeed.items ?? <RssItem>[];
      final blogs = rssItems
          .map(
            (item) => FeedArticle(
              item.title ?? '',
              item.link ?? '',
              item.dc!.date!,
              rssFeed.title ?? '',
              false,
              false,
            ),
          )
          .toList();
      return blogs;
    } else {
      final atomFeed = AtomFeed.parse(response.body);
      final atomItems = atomFeed.items ?? <AtomItem>[];
      final blogs = atomItems
          .map(
            (item) => FeedArticle(
                item.title ?? '',
                item.links?.first.href ?? '',
                item.updated ?? DateTime.now(),
                atomFeed.title ?? '',
                false,
                false),
          )
          .toList();
      return blogs;
    }
  }
}

class Feed {
  final List<FeedArticle> articleList;
  const Feed({
    required this.articleList,
  });
}

class FeedArticle {
  final String? title;
  final String? url;
  final DateTime? publishedDate;
  final String? blogName;
  final bool bookmarked;
  final bool alreadyRead;
  const FeedArticle(
    this.title,
    this.url,
    this.publishedDate,
    this.blogName,
    this.alreadyRead,
    this.bookmarked,
  );
}
