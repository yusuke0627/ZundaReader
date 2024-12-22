import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zunda_reader/models/feed_repositry.dart';

import '../screens/feedView.dart';

class FeedList extends StatefulWidget {
  final Feed feed;
  const FeedList(this.feed, {super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Called: FeedList.build");
    return ListView.builder(
        itemCount: widget.feed.articleList.length,
        itemBuilder: (context, i) => Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: ListTile(
                  onTap: () {
                    setState(() {
                      widget.feed.articleList[i] = FeedArticle(
                        widget.feed.articleList[i].title,
                        widget.feed.articleList[i].url,
                        widget.feed.articleList[i].publishedDate,
                        widget.feed.articleList[i].blogName,
                        true,
                        widget.feed.articleList[i].bookmarked,
                      );
                      FeedRepository.save(widget.feed.articleList[i]);
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SafeArea(
                                child: FeedView(
                                    url: widget.feed.articleList[i].url!))));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 40.0,
                          child: Text(
                            widget.feed.articleList[i].title!,
                            style: TextStyle(
                                fontSize: 14,
                                color: widget.feed.articleList[i].alreadyRead
                                    ? Colors.grey
                                    : Colors.black),
                          )),
                      Container(
                          height: 20.0,
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              widget.feed.articleList[i].bookmarked
                                  ? RichText(
                                      text: TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.bookmark_added_outlined,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ]))
                                  : RichText(
                                      text: const TextSpan(children: [
                                      WidgetSpan(
                                          child:
                                              Icon(Icons.bookmark_add_outlined))
                                    ])),
                              Text(widget.feed.articleList[i].blogName!,
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color:
                                          widget.feed.articleList[i].alreadyRead
                                              ? Colors.grey
                                              : Colors.black)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                DateFormat('yyyy/MM/dd(E) HH:mm').format(
                                    widget.feed.articleList[i].publishedDate!),
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color:
                                        widget.feed.articleList[i].alreadyRead
                                            ? Colors.grey
                                            : Colors.black),
                              )
                            ],
                          )),
                    ],
                  )),
            ));
  }
}
