import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/controller/help_controller.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final HelpController helpController = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: AppBar(
        title: KText(
          text: 'সাহায্য',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Obx(() => helpController.isLoading.value == true? CustomLoader(color: black, size: 30) :  ListView(
        children: [
          sizeH20,
          Image.asset(
            'assets/img/help.png',
            height: 100,
            width: 100,
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .2,
            radius: 0,
            child: Padding(
              padding: paddingH20V20,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'কল সেন্টার (7am-11:59pm)',
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                      KText(
                        text: helpController.helpline.value,
                        fontSize: 14,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: black,
                    child: Icon(
                      Icons.call,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH5,
          CustomCardWidget(
            elevation: .2,
            radius: 0,
            child: Padding(
              padding: paddingH20V20,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'ইমেইল',
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                      KText(
                        text: helpController.email.value,
                        fontSize: 14,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: black,
                    child: Icon(
                      Icons.email_outlined,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH5,
          GestureDetector(
            onTap: (){
             // launchYouTube(helpController.rental_video_link.toString()); Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
              _launchInBrowserView(Uri(host: helpController.rental_video_link.toString(),path: 'headers/'));
            },
            child: CustomCardWidget(
              elevation: .2,
              radius: 0,
              child: Padding(
                padding: paddingH20V20,
                child: Row(
                  children: [
                    KText(
                      text: 'রেন্টাল কিভাবে ব্যবহার করবেন',
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: black,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: white,
                        child: Icon(
                          Icons.smart_display_rounded,
                          color: black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          sizeH5,
          GestureDetector(
            onTap: (){
             // _launchInBrowserView(Uri(host: helpController.return_video_link.toString()));

              setState(() {
                _launchInBrowserView(Uri(host: "www.cylog.org",path: 'headers/'));
              });
            },
            child: CustomCardWidget(
              elevation: .2,
              radius: 0,
              child: Padding(
                padding: paddingH20V20,
                child: Row(
                  children: [
                    KText(
                      text: 'রিটার্ন কিভাবে ব্যবহার করবেন',
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: black,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: white,
                        child: Icon(
                          Icons.smart_display_rounded,
                          color: black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),)
    );
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
