import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/presentation/Auth_page/sign_in_page/sign_in_page.dart';
import 'package:used_car_app/presentation/main_page/main_page.dart';

class AuthGateWay extends StatelessWidget {
  const AuthGateWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const MainPage();
          }
          else{
            return const SignInPage();
          }
        },
      ),
    );
  }
}
