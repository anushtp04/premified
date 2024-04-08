// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_toggle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavouriteToggleEvent {
  UsedCarModel get carmodel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsedCarModel carmodel) favClickedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsedCarModel carmodel)? favClickedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsedCarModel carmodel)? favClickedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavouriteClickedEvent value) favClickedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavouriteClickedEvent value)? favClickedEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavouriteClickedEvent value)? favClickedEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteToggleEventCopyWith<FavouriteToggleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteToggleEventCopyWith<$Res> {
  factory $FavouriteToggleEventCopyWith(FavouriteToggleEvent value,
          $Res Function(FavouriteToggleEvent) then) =
      _$FavouriteToggleEventCopyWithImpl<$Res, FavouriteToggleEvent>;
  @useResult
  $Res call({UsedCarModel carmodel});

  $UsedCarModelCopyWith<$Res> get carmodel;
}

/// @nodoc
class _$FavouriteToggleEventCopyWithImpl<$Res,
        $Val extends FavouriteToggleEvent>
    implements $FavouriteToggleEventCopyWith<$Res> {
  _$FavouriteToggleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carmodel = null,
  }) {
    return _then(_value.copyWith(
      carmodel: null == carmodel
          ? _value.carmodel
          : carmodel // ignore: cast_nullable_to_non_nullable
              as UsedCarModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsedCarModelCopyWith<$Res> get carmodel {
    return $UsedCarModelCopyWith<$Res>(_value.carmodel, (value) {
      return _then(_value.copyWith(carmodel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavouriteClickedEventImplCopyWith<$Res>
    implements $FavouriteToggleEventCopyWith<$Res> {
  factory _$$FavouriteClickedEventImplCopyWith(
          _$FavouriteClickedEventImpl value,
          $Res Function(_$FavouriteClickedEventImpl) then) =
      __$$FavouriteClickedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UsedCarModel carmodel});

  @override
  $UsedCarModelCopyWith<$Res> get carmodel;
}

/// @nodoc
class __$$FavouriteClickedEventImplCopyWithImpl<$Res>
    extends _$FavouriteToggleEventCopyWithImpl<$Res,
        _$FavouriteClickedEventImpl>
    implements _$$FavouriteClickedEventImplCopyWith<$Res> {
  __$$FavouriteClickedEventImplCopyWithImpl(_$FavouriteClickedEventImpl _value,
      $Res Function(_$FavouriteClickedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carmodel = null,
  }) {
    return _then(_$FavouriteClickedEventImpl(
      carmodel: null == carmodel
          ? _value.carmodel
          : carmodel // ignore: cast_nullable_to_non_nullable
              as UsedCarModel,
    ));
  }
}

/// @nodoc

class _$FavouriteClickedEventImpl implements FavouriteClickedEvent {
  const _$FavouriteClickedEventImpl({required this.carmodel});

  @override
  final UsedCarModel carmodel;

  @override
  String toString() {
    return 'FavouriteToggleEvent.favClickedEvent(carmodel: $carmodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteClickedEventImpl &&
            (identical(other.carmodel, carmodel) ||
                other.carmodel == carmodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, carmodel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteClickedEventImplCopyWith<_$FavouriteClickedEventImpl>
      get copyWith => __$$FavouriteClickedEventImplCopyWithImpl<
          _$FavouriteClickedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsedCarModel carmodel) favClickedEvent,
  }) {
    return favClickedEvent(carmodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsedCarModel carmodel)? favClickedEvent,
  }) {
    return favClickedEvent?.call(carmodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsedCarModel carmodel)? favClickedEvent,
    required TResult orElse(),
  }) {
    if (favClickedEvent != null) {
      return favClickedEvent(carmodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavouriteClickedEvent value) favClickedEvent,
  }) {
    return favClickedEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavouriteClickedEvent value)? favClickedEvent,
  }) {
    return favClickedEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavouriteClickedEvent value)? favClickedEvent,
    required TResult orElse(),
  }) {
    if (favClickedEvent != null) {
      return favClickedEvent(this);
    }
    return orElse();
  }
}

abstract class FavouriteClickedEvent implements FavouriteToggleEvent {
  const factory FavouriteClickedEvent({required final UsedCarModel carmodel}) =
      _$FavouriteClickedEventImpl;

  @override
  UsedCarModel get carmodel;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteClickedEventImplCopyWith<_$FavouriteClickedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavouriteToggleState {
  bool get isFavourite => throw _privateConstructorUsedError;
  Option<Either<MainFailure, bool>> get favouriteToggleFailureOptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteToggleStateCopyWith<FavouriteToggleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteToggleStateCopyWith<$Res> {
  factory $FavouriteToggleStateCopyWith(FavouriteToggleState value,
          $Res Function(FavouriteToggleState) then) =
      _$FavouriteToggleStateCopyWithImpl<$Res, FavouriteToggleState>;
  @useResult
  $Res call(
      {bool isFavourite,
      Option<Either<MainFailure, bool>> favouriteToggleFailureOptions});
}

/// @nodoc
class _$FavouriteToggleStateCopyWithImpl<$Res,
        $Val extends FavouriteToggleState>
    implements $FavouriteToggleStateCopyWith<$Res> {
  _$FavouriteToggleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
    Object? favouriteToggleFailureOptions = null,
  }) {
    return _then(_value.copyWith(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      favouriteToggleFailureOptions: null == favouriteToggleFailureOptions
          ? _value.favouriteToggleFailureOptions
          : favouriteToggleFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteToggleStateImplCopyWith<$Res>
    implements $FavouriteToggleStateCopyWith<$Res> {
  factory _$$FavouriteToggleStateImplCopyWith(_$FavouriteToggleStateImpl value,
          $Res Function(_$FavouriteToggleStateImpl) then) =
      __$$FavouriteToggleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFavourite,
      Option<Either<MainFailure, bool>> favouriteToggleFailureOptions});
}

/// @nodoc
class __$$FavouriteToggleStateImplCopyWithImpl<$Res>
    extends _$FavouriteToggleStateCopyWithImpl<$Res, _$FavouriteToggleStateImpl>
    implements _$$FavouriteToggleStateImplCopyWith<$Res> {
  __$$FavouriteToggleStateImplCopyWithImpl(_$FavouriteToggleStateImpl _value,
      $Res Function(_$FavouriteToggleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavourite = null,
    Object? favouriteToggleFailureOptions = null,
  }) {
    return _then(_$FavouriteToggleStateImpl(
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      favouriteToggleFailureOptions: null == favouriteToggleFailureOptions
          ? _value.favouriteToggleFailureOptions
          : favouriteToggleFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ));
  }
}

/// @nodoc

class _$FavouriteToggleStateImpl implements _FavouriteToggleState {
  const _$FavouriteToggleStateImpl(
      {required this.isFavourite, required this.favouriteToggleFailureOptions});

  @override
  final bool isFavourite;
  @override
  final Option<Either<MainFailure, bool>> favouriteToggleFailureOptions;

  @override
  String toString() {
    return 'FavouriteToggleState(isFavourite: $isFavourite, favouriteToggleFailureOptions: $favouriteToggleFailureOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteToggleStateImpl &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.favouriteToggleFailureOptions,
                    favouriteToggleFailureOptions) ||
                other.favouriteToggleFailureOptions ==
                    favouriteToggleFailureOptions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFavourite, favouriteToggleFailureOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteToggleStateImplCopyWith<_$FavouriteToggleStateImpl>
      get copyWith =>
          __$$FavouriteToggleStateImplCopyWithImpl<_$FavouriteToggleStateImpl>(
              this, _$identity);
}

abstract class _FavouriteToggleState implements FavouriteToggleState {
  const factory _FavouriteToggleState(
      {required final bool isFavourite,
      required final Option<Either<MainFailure, bool>>
          favouriteToggleFailureOptions}) = _$FavouriteToggleStateImpl;

  @override
  bool get isFavourite;
  @override
  Option<Either<MainFailure, bool>> get favouriteToggleFailureOptions;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteToggleStateImplCopyWith<_$FavouriteToggleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
