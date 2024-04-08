// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavouritePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFavCarList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFavCarList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFavCarList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFavCarList value) fetchFavCarList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFavCarList value)? fetchFavCarList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFavCarList value)? fetchFavCarList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritePageEventCopyWith<$Res> {
  factory $FavouritePageEventCopyWith(
          FavouritePageEvent value, $Res Function(FavouritePageEvent) then) =
      _$FavouritePageEventCopyWithImpl<$Res, FavouritePageEvent>;
}

/// @nodoc
class _$FavouritePageEventCopyWithImpl<$Res, $Val extends FavouritePageEvent>
    implements $FavouritePageEventCopyWith<$Res> {
  _$FavouritePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchFavCarListImplCopyWith<$Res> {
  factory _$$FetchFavCarListImplCopyWith(_$FetchFavCarListImpl value,
          $Res Function(_$FetchFavCarListImpl) then) =
      __$$FetchFavCarListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFavCarListImplCopyWithImpl<$Res>
    extends _$FavouritePageEventCopyWithImpl<$Res, _$FetchFavCarListImpl>
    implements _$$FetchFavCarListImplCopyWith<$Res> {
  __$$FetchFavCarListImplCopyWithImpl(
      _$FetchFavCarListImpl _value, $Res Function(_$FetchFavCarListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchFavCarListImpl implements FetchFavCarList {
  const _$FetchFavCarListImpl();

  @override
  String toString() {
    return 'FavouritePageEvent.fetchFavCarList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchFavCarListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFavCarList,
  }) {
    return fetchFavCarList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFavCarList,
  }) {
    return fetchFavCarList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFavCarList,
    required TResult orElse(),
  }) {
    if (fetchFavCarList != null) {
      return fetchFavCarList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFavCarList value) fetchFavCarList,
  }) {
    return fetchFavCarList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFavCarList value)? fetchFavCarList,
  }) {
    return fetchFavCarList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFavCarList value)? fetchFavCarList,
    required TResult orElse(),
  }) {
    if (fetchFavCarList != null) {
      return fetchFavCarList(this);
    }
    return orElse();
  }
}

abstract class FetchFavCarList implements FavouritePageEvent {
  const factory FetchFavCarList() = _$FetchFavCarListImpl;
}

/// @nodoc
mixin _$FavouritePageState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UsedCarModel> get usedCarModel => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<UsedCarModel>>> get favPageFailureOptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritePageStateCopyWith<FavouritePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritePageStateCopyWith<$Res> {
  factory $FavouritePageStateCopyWith(
          FavouritePageState value, $Res Function(FavouritePageState) then) =
      _$FavouritePageStateCopyWithImpl<$Res, FavouritePageState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> favPageFailureOptions});
}

/// @nodoc
class _$FavouritePageStateCopyWithImpl<$Res, $Val extends FavouritePageState>
    implements $FavouritePageStateCopyWith<$Res> {
  _$FavouritePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? usedCarModel = null,
    Object? favPageFailureOptions = null,
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
      favPageFailureOptions: null == favPageFailureOptions
          ? _value.favPageFailureOptions
          : favPageFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouritePageStateImplCopyWith<$Res>
    implements $FavouritePageStateCopyWith<$Res> {
  factory _$$FavouritePageStateImplCopyWith(_$FavouritePageStateImpl value,
          $Res Function(_$FavouritePageStateImpl) then) =
      __$$FavouritePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> favPageFailureOptions});
}

/// @nodoc
class __$$FavouritePageStateImplCopyWithImpl<$Res>
    extends _$FavouritePageStateCopyWithImpl<$Res, _$FavouritePageStateImpl>
    implements _$$FavouritePageStateImplCopyWith<$Res> {
  __$$FavouritePageStateImplCopyWithImpl(_$FavouritePageStateImpl _value,
      $Res Function(_$FavouritePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? usedCarModel = null,
    Object? favPageFailureOptions = null,
  }) {
    return _then(_$FavouritePageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      usedCarModel: null == usedCarModel
          ? _value._usedCarModel
          : usedCarModel // ignore: cast_nullable_to_non_nullable
              as List<UsedCarModel>,
      favPageFailureOptions: null == favPageFailureOptions
          ? _value.favPageFailureOptions
          : favPageFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ));
  }
}

/// @nodoc

class _$FavouritePageStateImpl implements _FavouritePageState {
  const _$FavouritePageStateImpl(
      {required this.isLoading,
      required final List<UsedCarModel> usedCarModel,
      required this.favPageFailureOptions})
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
  final Option<Either<MainFailure, List<UsedCarModel>>> favPageFailureOptions;

  @override
  String toString() {
    return 'FavouritePageState(isLoading: $isLoading, usedCarModel: $usedCarModel, favPageFailureOptions: $favPageFailureOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouritePageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._usedCarModel, _usedCarModel) &&
            (identical(other.favPageFailureOptions, favPageFailureOptions) ||
                other.favPageFailureOptions == favPageFailureOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_usedCarModel),
      favPageFailureOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouritePageStateImplCopyWith<_$FavouritePageStateImpl> get copyWith =>
      __$$FavouritePageStateImplCopyWithImpl<_$FavouritePageStateImpl>(
          this, _$identity);
}

abstract class _FavouritePageState implements FavouritePageState {
  const factory _FavouritePageState(
      {required final bool isLoading,
      required final List<UsedCarModel> usedCarModel,
      required final Option<Either<MainFailure, List<UsedCarModel>>>
          favPageFailureOptions}) = _$FavouritePageStateImpl;

  @override
  bool get isLoading;
  @override
  List<UsedCarModel> get usedCarModel;
  @override
  Option<Either<MainFailure, List<UsedCarModel>>> get favPageFailureOptions;
  @override
  @JsonKey(ignore: true)
  _$$FavouritePageStateImplCopyWith<_$FavouritePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
