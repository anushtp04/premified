// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsedCars,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsedCars,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsedCars,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUsedCars value) getUsedCars,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUsedCars value)? getUsedCars,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUsedCars value)? getUsedCars,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res, HomePageEvent>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res, $Val extends HomePageEvent>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUsedCarsImplCopyWith<$Res> {
  factory _$$GetUsedCarsImplCopyWith(
          _$GetUsedCarsImpl value, $Res Function(_$GetUsedCarsImpl) then) =
      __$$GetUsedCarsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUsedCarsImplCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$GetUsedCarsImpl>
    implements _$$GetUsedCarsImplCopyWith<$Res> {
  __$$GetUsedCarsImplCopyWithImpl(
      _$GetUsedCarsImpl _value, $Res Function(_$GetUsedCarsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUsedCarsImpl implements GetUsedCars {
  const _$GetUsedCarsImpl();

  @override
  String toString() {
    return 'HomePageEvent.getUsedCars()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUsedCarsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUsedCars,
  }) {
    return getUsedCars();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUsedCars,
  }) {
    return getUsedCars?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUsedCars,
    required TResult orElse(),
  }) {
    if (getUsedCars != null) {
      return getUsedCars();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUsedCars value) getUsedCars,
  }) {
    return getUsedCars(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUsedCars value)? getUsedCars,
  }) {
    return getUsedCars?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUsedCars value)? getUsedCars,
    required TResult orElse(),
  }) {
    if (getUsedCars != null) {
      return getUsedCars(this);
    }
    return orElse();
  }
}

abstract class GetUsedCars implements HomePageEvent {
  const factory GetUsedCars() = _$GetUsedCarsImpl;
}

/// @nodoc
mixin _$HomePageState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UsedCarModel> get usedCarModel => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<UsedCarModel>>> get homePageFailureOptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> homePageFailureOptions});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? usedCarModel = null,
    Object? homePageFailureOptions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      usedCarModel: null == usedCarModel
          ? _value.usedCarModel
          : usedCarModel // ignore: cast_nullable_to_non_nullable
              as List<UsedCarModel>,
      homePageFailureOptions: null == homePageFailureOptions
          ? _value.homePageFailureOptions
          : homePageFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> homePageFailureOptions});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? usedCarModel = null,
    Object? homePageFailureOptions = null,
  }) {
    return _then(_$HomePageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      usedCarModel: null == usedCarModel
          ? _value._usedCarModel
          : usedCarModel // ignore: cast_nullable_to_non_nullable
              as List<UsedCarModel>,
      homePageFailureOptions: null == homePageFailureOptions
          ? _value.homePageFailureOptions
          : homePageFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {required this.isLoading,
      required final List<UsedCarModel> usedCarModel,
      required this.homePageFailureOptions})
      : _usedCarModel = usedCarModel;

  @override
  final bool isLoading;
  final List<UsedCarModel> _usedCarModel;
  @override
  List<UsedCarModel> get usedCarModel {
    if (_usedCarModel is EqualUnmodifiableListView) return _usedCarModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedCarModel);
  }

  @override
  final Option<Either<MainFailure, List<UsedCarModel>>> homePageFailureOptions;

  @override
  String toString() {
    return 'HomePageState(isLoading: $isLoading, usedCarModel: $usedCarModel, homePageFailureOptions: $homePageFailureOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._usedCarModel, _usedCarModel) &&
            (identical(other.homePageFailureOptions, homePageFailureOptions) ||
                other.homePageFailureOptions == homePageFailureOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_usedCarModel),
      homePageFailureOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {required final bool isLoading,
      required final List<UsedCarModel> usedCarModel,
      required final Option<Either<MainFailure, List<UsedCarModel>>>
          homePageFailureOptions}) = _$HomePageStateImpl;

  @override
  bool get isLoading;
  @override
  List<UsedCarModel> get usedCarModel;
  @override
  Option<Either<MainFailure, List<UsedCarModel>>> get homePageFailureOptions;
  @override
  @JsonKey(ignore: true)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
