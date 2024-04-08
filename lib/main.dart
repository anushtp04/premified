import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:used_car_app/application/favourite_toggle/favourite_toggle_bloc.dart';
import 'package:used_car_app/application/favouritepage_bloc/favourite_page_bloc.dart';
import 'package:used_car_app/application/homepage_bloc/home_page_bloc.dart';
import 'package:used_car_app/application/searchpage_bloc/search_page_bloc.dart';
import 'package:used_car_app/core/lighmodeOrDarkmode.dart';
import 'package:used_car_app/presentation/Auth_page/auth_gateway/auth_gateway.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';
import 'domain/dependency_injection/injectable.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureInjection();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>getIt<HomePageBloc>()..add(HomePageEvent.getUsedCars())),
        BlocProvider(create: (context) =>getIt<FavouritePageBloc>()),
        BlocProvider(create: (context) =>getIt<FavouriteToggleBloc>()),
        BlocProvider(create: (context) =>getIt<SearchPageBloc>()),
      ],
      child: ValueListenableBuilder(
        valueListenable: isDarkMode,
        builder: (context, value, child) {
          return GetMaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: isDarkMode.value?ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const AuthGateWay(),
          );
        },

      ),
    );
  }
}
