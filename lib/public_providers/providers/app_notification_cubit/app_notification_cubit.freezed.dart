// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppNotificationState {
  InAppNotification? get inAppNotification =>
      throw _privateConstructorUsedError;
  bool get isTurnOnNotification => throw _privateConstructorUsedError;

  /// Create a copy of AppNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationStateCopyWith<AppNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationStateCopyWith<$Res> {
  factory $AppNotificationStateCopyWith(AppNotificationState value,
          $Res Function(AppNotificationState) then) =
      _$AppNotificationStateCopyWithImpl<$Res, AppNotificationState>;
  @useResult
  $Res call({InAppNotification? inAppNotification, bool isTurnOnNotification});
}

/// @nodoc
class _$AppNotificationStateCopyWithImpl<$Res,
        $Val extends AppNotificationState>
    implements $AppNotificationStateCopyWith<$Res> {
  _$AppNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inAppNotification = freezed,
    Object? isTurnOnNotification = null,
  }) {
    return _then(_value.copyWith(
      inAppNotification: freezed == inAppNotification
          ? _value.inAppNotification
          : inAppNotification // ignore: cast_nullable_to_non_nullable
              as InAppNotification?,
      isTurnOnNotification: null == isTurnOnNotification
          ? _value.isTurnOnNotification
          : isTurnOnNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AppNotificationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InAppNotification? inAppNotification, bool isTurnOnNotification});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppNotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inAppNotification = freezed,
    Object? isTurnOnNotification = null,
  }) {
    return _then(_$InitialImpl(
      inAppNotification: freezed == inAppNotification
          ? _value.inAppNotification
          : inAppNotification // ignore: cast_nullable_to_non_nullable
              as InAppNotification?,
      isTurnOnNotification: null == isTurnOnNotification
          ? _value.isTurnOnNotification
          : isTurnOnNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(
      {this.inAppNotification, this.isTurnOnNotification = true});

  @override
  final InAppNotification? inAppNotification;
  @override
  @JsonKey()
  final bool isTurnOnNotification;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppNotificationState(inAppNotification: $inAppNotification, isTurnOnNotification: $isTurnOnNotification)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppNotificationState'))
      ..add(DiagnosticsProperty('inAppNotification', inAppNotification))
      ..add(DiagnosticsProperty('isTurnOnNotification', isTurnOnNotification));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.inAppNotification, inAppNotification) ||
                other.inAppNotification == inAppNotification) &&
            (identical(other.isTurnOnNotification, isTurnOnNotification) ||
                other.isTurnOnNotification == isTurnOnNotification));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, inAppNotification, isTurnOnNotification);

  /// Create a copy of AppNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AppNotificationState {
  const factory _Initial(
      {final InAppNotification? inAppNotification,
      final bool isTurnOnNotification}) = _$InitialImpl;

  @override
  InAppNotification? get inAppNotification;
  @override
  bool get isTurnOnNotification;

  /// Create a copy of AppNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
