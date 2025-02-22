// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reads _$ReadsFromJson(Map<String, dynamic> json) {
  return _Reads.fromJson(json);
}

/// @nodoc
mixin _$Reads {
  @JsonKey(name: "conversation_id")
  String? get conversationId => throw _privateConstructorUsedError;
  @JsonKey(name: "message_id")
  int? get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  int? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Reads to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadsCopyWith<Reads> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadsCopyWith<$Res> {
  factory $ReadsCopyWith(Reads value, $Res Function(Reads) then) =
      _$ReadsCopyWithImpl<$Res, Reads>;
  @useResult
  $Res call(
      {@JsonKey(name: "conversation_id") String? conversationId,
      @JsonKey(name: "message_id") int? messageId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") int? createdAt});
}

/// @nodoc
class _$ReadsCopyWithImpl<$Res, $Val extends Reads>
    implements $ReadsCopyWith<$Res> {
  _$ReadsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reads
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? messageId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadsImplCopyWith<$Res> implements $ReadsCopyWith<$Res> {
  factory _$$ReadsImplCopyWith(
          _$ReadsImpl value, $Res Function(_$ReadsImpl) then) =
      __$$ReadsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "conversation_id") String? conversationId,
      @JsonKey(name: "message_id") int? messageId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") int? createdAt});
}

/// @nodoc
class __$$ReadsImplCopyWithImpl<$Res>
    extends _$ReadsCopyWithImpl<$Res, _$ReadsImpl>
    implements _$$ReadsImplCopyWith<$Res> {
  __$$ReadsImplCopyWithImpl(
      _$ReadsImpl _value, $Res Function(_$ReadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reads
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? messageId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReadsImpl(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
class _$ReadsImpl implements _Reads {
  const _$ReadsImpl(
      {@JsonKey(name: "conversation_id") this.conversationId,
      @JsonKey(name: "message_id") this.messageId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$ReadsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadsImplFromJson(json);

  @override
  @JsonKey(name: "conversation_id")
  final String? conversationId;
  @override
  @JsonKey(name: "message_id")
  final int? messageId;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "created_at")
  final int? createdAt;

  @override
  String toString() {
    return 'Reads(conversationId: $conversationId, messageId: $messageId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadsImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, conversationId, messageId, userId, createdAt);

  /// Create a copy of Reads
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadsImplCopyWith<_$ReadsImpl> get copyWith =>
      __$$ReadsImplCopyWithImpl<_$ReadsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadsImplToJson(
      this,
    );
  }
}

abstract class _Reads implements Reads {
  const factory _Reads(
      {@JsonKey(name: "conversation_id") final String? conversationId,
      @JsonKey(name: "message_id") final int? messageId,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "created_at") final int? createdAt}) = _$ReadsImpl;

  factory _Reads.fromJson(Map<String, dynamic> json) = _$ReadsImpl.fromJson;

  @override
  @JsonKey(name: "conversation_id")
  String? get conversationId;
  @override
  @JsonKey(name: "message_id")
  int? get messageId;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "created_at")
  int? get createdAt;

  /// Create a copy of Reads
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadsImplCopyWith<_$ReadsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
