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
  bool vibrationValue = true;
  bool soundValue = true;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: 'ভাইব্রেশন',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Switch(
                value: vibrationValue,
                onChanged: (value) {
                  setState(() {
                    vibrationValue = value;
                  });
                  print(vibrationValue);
                },
              ),
            ],
          ),
          sizeH20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: 'সাউন্ড',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Switch(
                value: soundValue,
                onChanged: (value) {
                  setState(() {
                    soundValue = value;
                  });
                  print(soundValue);
                },
              ),
            ],
          ),

        ]),
      ),
    );
  }
}
