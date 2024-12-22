import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/feed_repositry.dart';

part 'feed_provider.g.dart';

@riverpod
Future<Feed> feed(Ref ref) async {
  return await FeedRepository.getFeed();
}
