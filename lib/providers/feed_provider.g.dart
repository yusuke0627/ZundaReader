// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedHash() => r'b8d401a4bf019b9ceb70d6f8c388f09479d6e587';

/// See also [feed].
@ProviderFor(feed)
final feedProvider = AutoDisposeFutureProvider<Feed>.internal(
  feed,
  name: r'feedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$feedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FeedRef = AutoDisposeFutureProviderRef<Feed>;
String _$bookmarkedFeedHash() => r'8538637447a7af70e3bc9c26ea5275d2c37d421b';

/// See also [bookmarkedFeed].
@ProviderFor(bookmarkedFeed)
final bookmarkedFeedProvider = AutoDisposeFutureProvider<Feed>.internal(
  bookmarkedFeed,
  name: r'bookmarkedFeedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookmarkedFeedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookmarkedFeedRef = AutoDisposeFutureProviderRef<Feed>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
