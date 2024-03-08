import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:used_car_app/application/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';
import 'package:used_car_app/presentation/main_page/main_page.dart';
import 'package:used_car_app/core/theme.dart';
import 'application/bloc/get_usedcar_bloc/get_used_car_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create:(context) => GetUsedCarBloc(FirebaseRepo())..add(GetUsedCar())),
          BlocProvider(create:(context) => BottomNavBloc()..add(TabChangedEvent(selectedIndex: 0))),
        ],

        child: MainPage(),
      ),
    );
  }
}
