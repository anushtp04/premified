import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/infrastructure/repository/auth_firebase_repo.dart';
import 'package:used_car_app/presentation/Auth_page/sign_in_page/sign_in_page.dart';
import 'package:used_car_app/presentation/Auth_page/widgets/myTextField.dart';
import 'package:used_car_app/presentation/main_page/widgets/appBar.dart';

import '../../widgets/text_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;

  final formKey = GlobalKey<FormState>();

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
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MyTextField(
                        hintText: "Name",
                        controller: nameController,
                        prefixIcon: Icon(Icons.person),
                        obscureText: false,
                        keyboardType: TextInputType.name,
                          validator: (val) {
                            if(val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if(val.length > 30) {
                              return 'Name too long';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail),
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if(val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if(!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock),
                        validator: (val) {
                          if(val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$').hasMatch(val)) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: cpasswordController,
                        hintText: "Confirm Password",
                        obscureText: obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                                if (obscurePassword) {
                                  iconPassword = CupertinoIcons.eye_fill;
                                } else {
                                  iconPassword = CupertinoIcons.eye_slash_fill;
                                }
                              });
                            },
                            icon: Icon(iconPassword)),
                        validator: (val) {
                          if(val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$').hasMatch(val)) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final name = nameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final cpassword = cpasswordController.text;
          
                            if(password == cpassword){
                              FireAuthHelper().signUp(email: email, password: password, name: name)
                                  .then((value) {
                                if (value == null) {
                                  Get.to(SignInPage());
                                } else {
                                  Get.snackbar("Error", "Something went wrong");
                                }
                              });
                            }
                            else{
                              Get.snackbar("error", "Passwords not matching");
                            }
          
                          }
                        },
                        height: 60,
                        minWidth: double.infinity,
                        color: Colors.blue.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: AppText(
                          text: "Sign Up",
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
          
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              AppText(
                                text: "Already have an account!!!",
                                color: Colors.black54,
                              ),
                              TextButton(
                                  onPressed: () => Get.offAll(SignInPage()),
                                  child: AppText(
                                    text: "Sign In now",
                                    size: 30,
                                    color: Colors.black,
                                  ))
                            ],
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
