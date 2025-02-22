// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Files _$FilesFromJson(Map<String, dynamic> json) {
  return _Files.fromJson(json);
}

/// @nodoc
mixin _$Files {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "mime_type")
  String? get mimeType => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_url")
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  int? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Files to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Files
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilesCopyWith<Files> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesCopyWith<$Res> {
  factory $FilesCopyWith(Files value, $Res Function(Files) then) =
      _$FilesCopyWithImpl<$Res, Files>;
  @useResult
  $Res call(
      {String? name,
      String? url,
      int? size,
      @JsonKey(name: "mime_type") String? mimeType,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      @JsonKey(name: "created_at") int? createdAt});
}

/// @nodoc
class _$FilesCopyWithImpl<$Res, $Val extends Files>
    implements $FilesCopyWith<$Res> {
  _$FilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Files
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? mimeType = freezed,
    Object? thumbnailUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilesImplCopyWith<$Res> implements $FilesCopyWith<$Res> {
  factory _$$FilesImplCopyWith(
          _$FilesImpl value, $Res Function(_$FilesImpl) then) =
      __$$FilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? url,
      int? size,
      @JsonKey(name: "mime_type") String? mimeType,
      @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
      @JsonKey(name: "created_at") int? createdAt});
}

/// @nodoc
class __$$FilesImplCopyWithImpl<$Res>
    extends _$FilesCopyWithImpl<$Res, _$FilesImpl>
    implements _$$FilesImplCopyWith<$Res> {
  __$$FilesImplCopyWithImpl(
      _$FilesImpl _value, $Res Function(_$FilesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Files
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? size = freezed,
    Object? mimeType = freezed,
    Object? thumbnailUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$FilesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilesImpl implements _Files {
  const _$FilesImpl(
      {this.name,
      this.url,
      this.size,
      @JsonKey(name: "mime_type") this.mimeType,
      @JsonKey(name: "thumbnail_url") this.thumbnailUrl,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$FilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilesImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;
  @override
  final int? size;
  @override
  @JsonKey(name: "mime_type")
  final String? mimeType;
  @override
  @JsonKey(name: "thumbnail_url")
  final String? thumbnailUrl;
  @override
  @JsonKey(name: "created_at")
  final int? createdAt;

  @override
  String toString() {
    return 'Files(name: $name, url: $url, size: $size, mimeType: $mimeType, thumbnailUrl: $thumbnailUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, url, size, mimeType, thumbnailUrl, createdAt);

  /// Create a copy of Files
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilesImplCopyWith<_$FilesImpl> get copyWith =>
      __$$FilesImplCopyWithImpl<_$FilesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilesImplToJson(
      this,
    );
  }
}

abstract class _Files implements Files {
  const factory _Files(
      {final String? name,
      final String? url,
      final int? size,
      @JsonKey(name: "mime_type") final String? mimeType,
      @JsonKey(name: "thumbnail_url") final String? thumbnailUrl,
      @JsonKey(name: "created_at") final int? createdAt}) = _$FilesImpl;

  factory _Files.fromJson(Map<String, dynamic> json) = _$FilesImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  int? get size;
  @override
  @JsonKey(name: "mime_type")
  String? get mimeType;
  @override
  @JsonKey(name: "thumbnail_url")
  String? get thumbnailUrl;
  @override
  @JsonKey(name: "created_at")
  int? get createdAt;

  /// Create a copy of Files
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilesImplCopyWith<_$FilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
