// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_current_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrenLocationClass {
  (String?, String?) get currentlocation => throw _privateConstructorUsedError;
  String get errormessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of CurrenLocationClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrenLocationClassCopyWith<CurrenLocationClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrenLocationClassCopyWith<$Res> {
  factory $CurrenLocationClassCopyWith(
          CurrenLocationClass value, $Res Function(CurrenLocationClass) then) =
      _$CurrenLocationClassCopyWithImpl<$Res, CurrenLocationClass>;
  @useResult
  $Res call(
      {(String?, String?) currentlocation,
      String errormessage,
      bool isLoading});
}

/// @nodoc
class _$CurrenLocationClassCopyWithImpl<$Res, $Val extends CurrenLocationClass>
    implements $CurrenLocationClassCopyWith<$Res> {
  _$CurrenLocationClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrenLocationClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentlocation = null,
    Object? errormessage = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      currentlocation: null == currentlocation
          ? _value.currentlocation
          : currentlocation // ignore: cast_nullable_to_non_nullable
              as (String?, String?),
      errormessage: null == errormessage
          ? _value.errormessage
          : errormessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrenLocationClassImplCopyWith<$Res>
    implements $CurrenLocationClassCopyWith<$Res> {
  factory _$$CurrenLocationClassImplCopyWith(_$CurrenLocationClassImpl value,
          $Res Function(_$CurrenLocationClassImpl) then) =
      __$$CurrenLocationClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {(String?, String?) currentlocation,
      String errormessage,
      bool isLoading});
}

/// @nodoc
class __$$CurrenLocationClassImplCopyWithImpl<$Res>
    extends _$CurrenLocationClassCopyWithImpl<$Res, _$CurrenLocationClassImpl>
    implements _$$CurrenLocationClassImplCopyWith<$Res> {
  __$$CurrenLocationClassImplCopyWithImpl(_$CurrenLocationClassImpl _value,
      $Res Function(_$CurrenLocationClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrenLocationClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentlocation = null,
    Object? errormessage = null,
    Object? isLoading = null,
  }) {
    return _then(_$CurrenLocationClassImpl(
      currentlocation: null == currentlocation
          ? _value.currentlocation
          : currentlocation // ignore: cast_nullable_to_non_nullable
              as (String?, String?),
      errormessage: null == errormessage
          ? _value.errormessage
          : errormessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CurrenLocationClassImpl implements _CurrenLocationClass {
  const _$CurrenLocationClassImpl(
      {required this.currentlocation,
      required this.errormessage,
      required this.isLoading});

  @override
  final (String?, String?) currentlocation;
  @override
  final String errormessage;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CurrenLocationClass(currentlocation: $currentlocation, errormessage: $errormessage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrenLocationClassImpl &&
            (identical(other.currentlocation, currentlocation) ||
                other.currentlocation == currentlocation) &&
            (identical(other.errormessage, errormessage) ||
                other.errormessage == errormessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentlocation, errormessage, isLoading);

  /// Create a copy of CurrenLocationClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrenLocationClassImplCopyWith<_$CurrenLocationClassImpl> get copyWith =>
      __$$CurrenLocationClassImplCopyWithImpl<_$CurrenLocationClassImpl>(
          this, _$identity);
}

abstract class _CurrenLocationClass implements CurrenLocationClass {
  const factory _CurrenLocationClass(
      {required final (String?, String?) currentlocation,
      required final String errormessage,
      required final bool isLoading}) = _$CurrenLocationClassImpl;

  @override
  (String?, String?) get currentlocation;
  @override
  String get errormessage;
  @override
  bool get isLoading;

  /// Create a copy of CurrenLocationClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrenLocationClassImplCopyWith<_$CurrenLocationClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
