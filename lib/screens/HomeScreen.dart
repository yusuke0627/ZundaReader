import 'package:feedable/util/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/feed.dart';
import '../widgets/feed_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Feed> feeds = [];
  _HomeScreenState() {
    fetchFeed();
  }
  void fetchFeed() async {
    await getFeed("http://alfalfalfa.com/index.rdf", FeedType.rss)
        .then((value) => setState(() {
              feeds = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedable')),
      body: ListView.builder(
        itemBuilder: (context, i) => Slidable(
            key: UniqueKey(),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  label: 'Later',
                )
              ],
            ),
            child: FeedItem(feeds[i].title, feeds[i].blogName, feeds[i].url)),
        itemCount: feeds.length,
      ),
    );
  }
}