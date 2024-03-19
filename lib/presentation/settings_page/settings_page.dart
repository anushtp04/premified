import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:used_car_app/infrastructure/repository/auth_firebase_repo.dart';
import 'package:used_car_app/presentation/Auth_page/sign_in_page/sign_in_page.dart';
import 'package:used_car_app/presentation/main_page/widgets/bottom_nav_bar.dart';
import 'package:used_car_app/presentation/settings_page/widgets/rawWidget.dart';
import 'package:used_car_app/presentation/settings_page/widgets/smallButtons.dart';
import '../widgets/text_style.dart';

ValueNotifier<bool> isDarkMode = ValueNotifier(false);

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .27,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Hello Anush",
                          size: 24,
                        ),
                        MaterialButton(
                          onPressed: () {
                            FireAuthHelper().signOut().then((value){
                              Get.offAll(SignInPage());
                              indexChangeNotifier.value = 0;
                              isDarkMode.value = false;
                            });
                          },
                          height: 40,
                          child: AppText(text: "Sign Out"),
                          color: Colors.red,
                        )
                      ],
                    ),
                    AppText(
                      text: "anushtp04@gmail.com",
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                     ValueListenableBuilder(
                       valueListenable: isDarkMode,
                       builder: (BuildContext context, newValue, Widget? child) {
                         return  Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               SmallButtons(
                                 icon: Icons.mail,
                                 text: "Inbox",
                                 onTapFunction: () {},
                               ),
                               SmallButtons(
                                 icon: Icons.favorite_border,
                                 text: "Favourites",
                                 onTapFunction: () {},
                               ),
                               SmallButtons(
                                   icon: Icons.call,
                                   text: "Contact",
                                   onTapFunction: () {}),
                               SmallButtons(
                                   color: isDarkMode.value? Colors.blue: Colors.amber,
                                   icon: isDarkMode.value
                                       ? Icons.dark_mode
                                       : Icons.sunny,
                                   text:isDarkMode.value
                                       ? "Dark Mode"
                                       : "Light Mode",
                                   onTapFunction: () {
                                     isDarkMode.value = !isDarkMode.value;
                                   })
                             ]);
                       },
          
                     )
          
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Settings",
                      size: 20,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    settingsRowWidget(
                      mainText: 'Profile',
                      icon: Icons.person,
                    ),
                    settingsRowWidget(
                      mainText: 'Country',
                      subText: "India",
                      icon: Icons.language,
                      flagicon: Flag(Flags.india),
                    ),
                    settingsRowWidget(
                      mainText: 'Language',
                      subText: "English",
                      icon: Icons.message_outlined,
                    ),
                    settingsRowWidget(
                        mainText: 'Preference', icon: Icons.feed_outlined),
                    settingsRowWidget(
                      mainText: 'Terms & Conditions',
                      icon: Icons.shield,
                    ),
                    settingsRowWidget(
                      mainText: 'About App',
                      icon: Icons.feed_sharp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
