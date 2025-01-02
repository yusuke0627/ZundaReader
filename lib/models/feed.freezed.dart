// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Feed {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get publishedDate => throw _privateConstructorUsedError;
  String get blogName => throw _privateConstructorUsedError;
  bool get bookmarked => throw _privateConstructorUsedError;
  bool get alreadyRead => throw _privateConstructorUsedError;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call(
      {String title,
      String url,
      DateTime publishedDate,
      String blogName,
      bool bookmarked,
      bool alreadyRead});
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? publishedDate = null,
    Object? blogName = null,
    Object? bookmarked = null,
    Object? alreadyRead = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      blogName: null == blogName
          ? _value.blogName
          : blogName // ignore: cast_nullable_to_non_nullable
              as String,
      bookmarked: null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      alreadyRead: null == alreadyRead
          ? _value.alreadyRead
          : alreadyRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
          _$FeedImpl value, $Res Function(_$FeedImpl) then) =
      __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String url,
      DateTime publishedDate,
      String blogName,
      bool bookmarked,
      bool alreadyRead});
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? publishedDate = null,
    Object? blogName = null,
    Object? bookmarked = null,
    Object? alreadyRead = null,
  }) {
    return _then(_$FeedImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == blogName
          ? _value.blogName
          : blogName // ignore: cast_nullable_to_non_nullable
              as String,
      null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      null == alreadyRead
          ? _value.alreadyRead
          : alreadyRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FeedImpl implements _Feed {
  const _$FeedImpl(this.title, this.url, this.publishedDate, this.blogName,
      this.bookmarked, this.alreadyRead);

  @override
  final String title;
  @override
  final String url;
  @override
  final DateTime publishedDate;
  @override
  final String blogName;
  @override
  final bool bookmarked;
  @override
  final bool alreadyRead;

  @override
  String toString() {
    return 'Feed(title: $title, url: $url, publishedDate: $publishedDate, blogName: $blogName, bookmarked: $bookmarked, alreadyRead: $alreadyRead)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.blogName, blogName) ||
                other.blogName == blogName) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.alreadyRead, alreadyRead) ||
                other.alreadyRead == alreadyRead));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, url, publishedDate,
      blogName, bookmarked, alreadyRead);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);
}

abstract class _Feed implements Feed {
  const factory _Feed(
      final String title,
      final String url,
      final DateTime publishedDate,
      final String blogName,
      final bool bookmarked,
      final bool alreadyRead) = _$FeedImpl;

  @override
  String get title;
  @override
  String get url;
  @override
  DateTime get publishedDate;
  @override
  String get blogName;
  @override
  bool get bookmarked;
  @override
  bool get alreadyRead;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
