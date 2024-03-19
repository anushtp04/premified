import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/core/sizes.dart';
import 'package:used_car_app/presentation/Auth_page/sign_up_page/sign_up_page.dart';
import 'package:used_car_app/presentation/Auth_page/widgets/myTextField.dart';
import 'package:used_car_app/presentation/main_page/main_page.dart';
import 'package:used_car_app/presentation/main_page/widgets/appBar.dart';
import '../../../infrastructure/repository/auth_firebase_repo.dart';
import '../../widgets/text_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 300,
                  height: 200,
                  child: Lottie.asset("assets/login.json",fit: BoxFit.fill)),
          
              Form(
                key: formState,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(
                      controller: emailController,
                      hintText: "Email",
                      prefixIcon:  Icon(Icons.mail),
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: ScreenUtil.getTwentySize(context),
                  ),
                  MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock),
          
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                            if(obscurePassword){
                              iconPassword = CupertinoIcons.eye_fill;
                            }
                            else{
                              iconPassword = CupertinoIcons.eye_slash_fill;
                            }
                          });
                        },
                        icon: Icon(iconPassword)),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$').hasMatch(val)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      }
          
                  ),
                  TextButton(
                      onPressed: () => null,
                      child: AppText(
                        text: "Forget Password",
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if(formState.currentState!.validate()){
                        final email = emailController.text;
                        final password = passwordController.text;
                        FireAuthHelper()
                            .signIn(email: email, password: password)
                            .then((value) {
                          if (value == null) {
                            Get.offAll(MainPage());
                          } else {
                            Get.snackbar("Error", "Something went wrong");
                          }
                        });
                      }
                    },
                    height: ScreenUtil.getSixty(context),
                    minWidth: double.infinity,
                    color: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: AppText(text: "Sign In",color: Colors.white,size: ScreenUtil.getEighteenSize(context),),
                  ),
                  SizedBox(height: 40,),
          
                  Align(
                    alignment: Alignment.center,
                      child: Column(
                        children: [
                          AppText(text: "Don't have an account ?",color: Colors.black54,),
                          TextButton(
                              onPressed: () => Get.to(SignUpPage()), child: AppText(
                            text: "Sign up now",
                            size: ScreenUtil.getThirtySize(context),
                            color: Colors.black,
                          ))
                        ],
                      )
                  )
          
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

