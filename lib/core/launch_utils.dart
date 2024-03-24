import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  static Future<void> launchWhatsApp(context,String carName) async {
    var phoneNumber = "+917907027464";
    final Uri whatsappAndroid = Uri.parse(
      "whatsapp://send?phone=$phoneNumber&text=Car Details -\n$carName",
    );
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  static Future<void> launchEmail(String carName) async{
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'anushtp04@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Car Details - ${carName}',
      }),
    );
   await launchUrl(emailLaunchUri);
  }

  static Future<void> launchPhoneCall() async{
    final Uri callLauncher = Uri(
      scheme: 'tel',
      path: '+91 9999999999',
    );
   await launchUrl(callLauncher);
  }
}