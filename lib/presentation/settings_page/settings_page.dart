import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:used_car_app/presentation/settings_page/widgets/rawWidget.dart';
import 'package:used_car_app/presentation/settings_page/widgets/smallButtons.dart';
import '../widgets/text_style.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height*.27,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height*.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Hello Anush",
                        size: 24,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red
                        ),
                        child: AppText( text: "Sign Out",fontWeight: FontWeight.w500,size: 15,),

                      )
                    ],
                  ),
                  AppText(
                    text: "anushtp04@gmail.com",
                    size: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  Row(
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

                        icon: Icons.sunny,
                        text: "Light Mode",
                        onTapFunction: () {}
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height*0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: "Settings",size: 20,),
                  SizedBox(height: height*0.02,),
                  settingsRowWidget(mainText: 'Profile', icon: Icons.person,),
                  settingsRowWidget(mainText: 'Country',subText: "India",icon: Icons.language,),
                  settingsRowWidget(mainText: 'Language',subText: "English",icon: Icons.message_outlined,),
                  settingsRowWidget(mainText: 'Preference',icon: Icons.feed_outlined),
                  settingsRowWidget(mainText: 'Terms & Conditions',icon: Icons.shield,),
                  settingsRowWidget(mainText: 'About App',icon: Icons.feed_sharp,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

