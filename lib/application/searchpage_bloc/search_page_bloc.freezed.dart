// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? name) searchButtonClicked,
    required TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)
        filterButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? name)? searchButtonClicked,
    TResult? Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? name)? searchButtonClicked,
    TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(SearchButtonClicked value) searchButtonClicked,
    required TResult Function(FilterButtonClicked value) filterButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(SearchButtonClicked value)? searchButtonClicked,
    TResult? Function(FilterButtonClicked value)? filterButtonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(SearchButtonClicked value)? searchButtonClicked,
    TResult Function(FilterButtonClicked value)? filterButtonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageEventCopyWith<$Res> {
  factory $SearchPageEventCopyWith(
          SearchPageEvent value, $Res Function(SearchPageEvent) then) =
      _$SearchPageEventCopyWithImpl<$Res, SearchPageEvent>;
}

/// @nodoc
class _$SearchPageEventCopyWithImpl<$Res, $Val extends SearchPageEvent>
    implements $SearchPageEventCopyWith<$Res> {
  _$SearchPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$SearchPageEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'SearchPageEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? name) searchButtonClicked,
    required TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)
        filterButtonClicked,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? name)? searchButtonClicked,
    TResult? Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? name)? searchButtonClicked,
    TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(SearchButtonClicked value) searchButtonClicked,
    required TResult Function(FilterButtonClicked value) filterButtonClicked,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(SearchButtonClicked value)? searchButtonClicked,
    TResult? Function(FilterButtonClicked value)? filterButtonClicked,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(SearchButtonClicked value)? searchButtonClicked,
    TResult Function(FilterButtonClicked value)? filterButtonClicked,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements SearchPageEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$SearchButtonClickedImplCopyWith<$Res> {
  factory _$$SearchButtonClickedImplCopyWith(_$SearchButtonClickedImpl value,
          $Res Function(_$SearchButtonClickedImpl) then) =
      __$$SearchButtonClickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class __$$SearchButtonClickedImplCopyWithImpl<$Res>
    extends _$SearchPageEventCopyWithImpl<$Res, _$SearchButtonClickedImpl>
    implements _$$SearchButtonClickedImplCopyWith<$Res> {
  __$$SearchButtonClickedImplCopyWithImpl(_$SearchButtonClickedImpl _value,
      $Res Function(_$SearchButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$SearchButtonClickedImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchButtonClickedImpl implements SearchButtonClicked {
  const _$SearchButtonClickedImpl({this.name});

  @override
  final String? name;

  @override
  String toString() {
    return 'SearchPageEvent.searchButtonClicked(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchButtonClickedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchButtonClickedImplCopyWith<_$SearchButtonClickedImpl> get copyWith =>
      __$$SearchButtonClickedImplCopyWithImpl<_$SearchButtonClickedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? name) searchButtonClicked,
    required TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)
        filterButtonClicked,
  }) {
    return searchButtonClicked(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? name)? searchButtonClicked,
    TResult? Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
  }) {
    return searchButtonClicked?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? name)? searchButtonClicked,
    TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
    required TResult orElse(),
  }) {
    if (searchButtonClicked != null) {
      return searchButtonClicked(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(SearchButtonClicked value) searchButtonClicked,
    required TResult Function(FilterButtonClicked value) filterButtonClicked,
  }) {
    return searchButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(SearchButtonClicked value)? searchButtonClicked,
    TResult? Function(FilterButtonClicked value)? filterButtonClicked,
  }) {
    return searchButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(SearchButtonClicked value)? searchButtonClicked,
    TResult Function(FilterButtonClicked value)? filterButtonClicked,
    required TResult orElse(),
  }) {
    if (searchButtonClicked != null) {
      return searchButtonClicked(this);
    }
    return orElse();
  }
}

abstract class SearchButtonClicked implements SearchPageEvent {
  const factory SearchButtonClicked({final String? name}) =
      _$SearchButtonClickedImpl;

  String? get name;
  @JsonKey(ignore: true)
  _$$SearchButtonClickedImplCopyWith<_$SearchButtonClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterButtonClickedImplCopyWith<$Res> {
  factory _$$FilterButtonClickedImplCopyWith(_$FilterButtonClickedImpl value,
          $Res Function(_$FilterButtonClickedImpl) then) =
      __$$FilterButtonClickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? brandId, String? typeId, String? colorId, String? rangeId});
}

/// @nodoc
class __$$FilterButtonClickedImplCopyWithImpl<$Res>
    extends _$SearchPageEventCopyWithImpl<$Res, _$FilterButtonClickedImpl>
    implements _$$FilterButtonClickedImplCopyWith<$Res> {
  __$$FilterButtonClickedImplCopyWithImpl(_$FilterButtonClickedImpl _value,
      $Res Function(_$FilterButtonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = freezed,
    Object? typeId = freezed,
    Object? colorId = freezed,
    Object? rangeId = freezed,
  }) {
    return _then(_$FilterButtonClickedImpl(
      brandId: freezed == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as String?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as String?,
      colorId: freezed == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as String?,
      rangeId: freezed == rangeId
          ? _value.rangeId
          : rangeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterButtonClickedImpl implements FilterButtonClicked {
  const _$FilterButtonClickedImpl(
      {this.brandId, this.typeId, this.colorId, this.rangeId});

  @override
  final String? brandId;
  @override
  final String? typeId;
  @override
  final String? colorId;
  @override
  final String? rangeId;

  @override
  String toString() {
    return 'SearchPageEvent.filterButtonClicked(brandId: $brandId, typeId: $typeId, colorId: $colorId, rangeId: $rangeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterButtonClickedImpl &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.rangeId, rangeId) || other.rangeId == rangeId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brandId, typeId, colorId, rangeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterButtonClickedImplCopyWith<_$FilterButtonClickedImpl> get copyWith =>
      __$$FilterButtonClickedImplCopyWithImpl<_$FilterButtonClickedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? name) searchButtonClicked,
    required TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)
        filterButtonClicked,
  }) {
    return filterButtonClicked(brandId, typeId, colorId, rangeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? name)? searchButtonClicked,
    TResult? Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
  }) {
    return filterButtonClicked?.call(brandId, typeId, colorId, rangeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? name)? searchButtonClicked,
    TResult Function(
            String? brandId, String? typeId, String? colorId, String? rangeId)?
        filterButtonClicked,
    required TResult orElse(),
  }) {
    if (filterButtonClicked != null) {
      return filterButtonClicked(brandId, typeId, colorId, rangeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
    required TResult Function(SearchButtonClicked value) searchButtonClicked,
    required TResult Function(FilterButtonClicked value) filterButtonClicked,
  }) {
    return filterButtonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
    TResult? Function(SearchButtonClicked value)? searchButtonClicked,
    TResult? Function(FilterButtonClicked value)? filterButtonClicked,
  }) {
    return filterButtonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    TResult Function(SearchButtonClicked value)? searchButtonClicked,
    TResult Function(FilterButtonClicked value)? filterButtonClicked,
    required TResult orElse(),
  }) {
    if (filterButtonClicked != null) {
      return filterButtonClicked(this);
    }
    return orElse();
  }
}

abstract class FilterButtonClicked implements SearchPageEvent {
  const factory FilterButtonClicked(
      {final String? brandId,
      final String? typeId,
      final String? colorId,
      final String? rangeId}) = _$FilterButtonClickedImpl;

  String? get brandId;
  String? get typeId;
  String? get colorId;
  String? get rangeId;
  @JsonKey(ignore: true)
  _$$FilterButtonClickedImplCopyWith<_$FilterButtonClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchPageState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<UsedCarModel> get usedCarModel => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<UsedCarModel>>> get searchFailureOptions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPageStateCopyWith<SearchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPageStateCopyWith<$Res> {
  factory $SearchPageStateCopyWith(
          SearchPageState value, $Res Function(SearchPageState) then) =
      _$SearchPageStateCopyWithImpl<$Res, SearchPageState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> searchFailureOptions});
}

/// @nodoc
class _$SearchPageStateCopyWithImpl<$Res, $Val extends SearchPageState>
    implements $SearchPageStateCopyWith<$Res> {
  _$SearchPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? usedCarModel = null,
    Object? searchFailureOptions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      usedCarModel: null == usedCarModel
          ? _value.usedCarModel
          : usedCarModel // ignore: cast_nullable_to_non_nullable
              as List<UsedCarModel>,
      searchFailureOptions: null == searchFailureOptions
          ? _value.searchFailureOptions
          : searchFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPageStateImplCopyWith<$Res>
    implements $SearchPageStateCopyWith<$Res> {
  factory _$$SearchPageStateImplCopyWith(_$SearchPageStateImpl value,
          $Res Function(_$SearchPageStateImpl) then) =
      __$$SearchPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      List<UsedCarModel> usedCarModel,
      Option<Either<MainFailure, List<UsedCarModel>>> searchFailureOptions});
}

/// @nodoc
class __$$SearchPageStateImplCopyWithImpl<$Res>
    extends _$SearchPageStateCopyWithImpl<$Res, _$SearchPageStateImpl>
    implements _$$SearchPageStateImplCopyWith<$Res> {
  __$$SearchPageStateImplCopyWithImpl(
      _$SearchPageStateImpl _value, $Res Function(_$SearchPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? usedCarModel = null,
    Object? searchFailureOptions = null,
  }) {
    return _then(_$SearchPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      usedCarModel: null == usedCarModel
          ? _value._usedCarModel
          : usedCarModel // ignore: cast_nullable_to_non_nullable
              as List<UsedCarModel>,
      searchFailureOptions: null == searchFailureOptions
          ? _value.searchFailureOptions
          : searchFailureOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<UsedCarModel>>>,
    ));
  }
}

/// @nodoc

class _$SearchPageStateImpl implements _SearchPageState {
  const _$SearchPageStateImpl(
      {required this.isLoading,
      required this.isError,
      required final List<UsedCarModel> usedCarModel,
      required this.searchFailureOptions})
      : _usedCarModel = usedCarModel;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<UsedCarModel> _usedCarModel;
  @override
  List<UsedCarModel> get usedCarModel {
    if (_usedCarModel is EqualUnmodifiableListView) return _usedCarModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedCarModel);
  }

  @override
  final Option<Either<MainFailure, List<UsedCarModel>>> searchFailureOptions;

  @override
  String toString() {
    return 'SearchPageState(isLoading: $isLoading, isError: $isError, usedCarModel: $usedCarModel, searchFailureOptions: $searchFailureOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._usedCarModel, _usedCarModel) &&
            (identical(other.searchFailureOptions, searchFailureOptions) ||
                other.searchFailureOptions == searchFailureOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      const DeepCollectionEquality().hash(_usedCarModel), searchFailureOptions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPageStateImplCopyWith<_$SearchPageStateImpl> get copyWith =>
      __$$SearchPageStateImplCopyWithImpl<_$SearchPageStateImpl>(
          this, _$identity);
}

abstract class _SearchPageState implements SearchPageState {
  const factory _SearchPageState(
      {required final bool isLoading,
      required final bool isError,
      required final List<UsedCarModel> usedCarModel,
      required final Option<Either<MainFailure, List<UsedCarModel>>>
          searchFailureOptions}) = _$SearchPageStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<UsedCarModel> get usedCarModel;
  @override
  Option<Either<MainFailure, List<UsedCarModel>>> get searchFailureOptions;
  @override
  @JsonKey(ignore: true)
  _$$SearchPageStateImplCopyWith<_$SearchPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
