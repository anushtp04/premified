import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:used_car_app/application/bloc/details_page_bloc/details_page_bloc.dart';
import 'package:used_car_app/application/bloc/favourite_screen_bloc/favourite_screen_bloc.dart';
import 'package:used_car_app/application/bloc/favourite_toggle_bloc/favourite_toggle_bloc.dart';
import 'package:used_car_app/application/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:used_car_app/core/lighmodeOrDarkmode.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';
import 'package:used_car_app/presentation/Auth_page/auth_gateway/auth_gateway.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';
import 'application/bloc/home_page_bloc/get_used_car_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GetUsedCarBloc(FirebaseRepo())..add(GetUsedCar())),
        BlocProvider(create: (context) =>FavouriteScreenBloc()),
        BlocProvider(create: (context) => SearchPageBloc()),
        BlocProvider(create: (context) => FavouriteToggleBloc()),
      ],
      child: ValueListenableBuilder(
        valueListenable: isDarkMode,
        builder: (BuildContext context, newValue, Widget? child) {
          return GetMaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const AuthGateWay(),
          );
        },
      ),
    );
  }
}
