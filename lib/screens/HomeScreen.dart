import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/feed_provider.dart';
import '../widgets/feed_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Called HomeScreenState.build");
    return Scaffold(
        body: ref.watch(feedProvider).when(
            data: ((feed) {
              return RefreshIndicator(
                  onRefresh: () => ref.refresh(feedProvider.future),
                  child: FeedList(feed));
            }),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text(error.toString())));
  }
}
