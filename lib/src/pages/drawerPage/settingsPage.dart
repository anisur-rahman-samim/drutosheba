import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:flutter/material.dart';
import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String vibration = 'চালু';
  String sound = 'চালু';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'সেটিংস',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: paddingH20V20,
        child: ListView(children: [
          Row(
            children: [
              KText(
                text: 'ভাইব্রেশন',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              KText(
                text: '',
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 'চালু',
                groupValue: vibration,
                activeColor: primaryColor,
                onChanged: (String? value) {
                  setState(() {
                    vibration = value!;
                  });
                },
              ),
              KText(
                text: 'চালু',
                fontSize: 14,
              ),
              Radio(
                value: 'বন্ধ',
                groupValue: vibration,
                activeColor: primaryColor,
                onChanged: (String? value) {
                  setState(() {
                    vibration = value!;
                  });
                },
              ),
              KText(
                text: 'বন্ধ',
                fontSize: 14,
              ),
            ],
          ),
          sizeH20,
          Row(
            children: [
              KText(
                text: 'সাউন্ড',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              KText(
                text: '',
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 'চালু',
                groupValue: sound,
                activeColor: primaryColor,
                onChanged: (String? value) {
                  setState(() {
                    sound = value!;
                  });
                },
              ),
              KText(
                text: 'চালু',
                fontSize: 14,
              ),
              Radio(
                value: 'বন্ধ',
                groupValue: sound,
                activeColor: primaryColor,
                onChanged: (String? value) {
                  setState(() {
                    sound = value!;
                  });
                },
              ),
              KText(
                text: 'বন্ধ',
                fontSize: 14,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
