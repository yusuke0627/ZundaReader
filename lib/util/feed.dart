import 'package:http/http.dart' as http;
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:feedable/models/feed.dart';

enum FeedType {
  rss,
  atom,
}

Future<List<Feed>> getFeed(String url, FeedType type) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode != 200) {
    throw Exception('Failed to getFeed');
  }
  if (type == FeedType.rss) {
    final rssFeed = RssFeed.parse(response.body);
    final rssItemlist = rssFeed.items ?? <RssItem>[];
    final blogs = rssItemlist
        .map(
          (item) => Feed(
            url: item.link ?? '',
            title: item.title ?? '',
            date: item.pubDate ?? DateTime.now(),
            blogName: rssFeed.title ?? '',
          ),
        )
        .toList();
    return blogs;
  } else if (type == FeedType.atom) {
    final atomFeed = AtomFeed.parse(response.body);
    final atomItemlist = atomFeed.items ?? <AtomItem>[];
    final blogs = atomItemlist
        .map(
          (item) => Feed(
            url: item.links?.first.href ?? '',
            title: item.title ?? '',
            date: item.updated ?? DateTime.now(),
            blogName: atomFeed.title ?? '',
          ),
        )
        .toList();
    return blogs;
  }
  return [];
}