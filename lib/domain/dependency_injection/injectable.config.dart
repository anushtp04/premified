// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:used_car_app/application/favourite_toggle/favourite_toggle_bloc.dart'
    as _i8;
import 'package:used_car_app/application/favouritepage_bloc/favourite_page_bloc.dart'
    as _i7;
import 'package:used_car_app/application/homepage_bloc/home_page_bloc.dart'
    as _i5;
import 'package:used_car_app/application/searchpage_bloc/search_page_bloc.dart'
    as _i6;
import 'package:used_car_app/domain/i_firebase_repo.dart' as _i3;
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IFirebaseRepo>(() => _i4.FirebaseRepo());
    gh.factory<_i5.HomePageBloc>(
        () => _i5.HomePageBloc(gh<_i3.IFirebaseRepo>()));
    gh.factory<_i6.SearchPageBloc>(
        () => _i6.SearchPageBloc(gh<_i3.IFirebaseRepo>()));
    gh.factory<_i7.FavouritePageBloc>(
        () => _i7.FavouritePageBloc(gh<_i3.IFirebaseRepo>()));
    gh.factory<_i8.FavouriteToggleBloc>(
        () => _i8.FavouriteToggleBloc(gh<_i3.IFirebaseRepo>()));
    return this;
  }
}
