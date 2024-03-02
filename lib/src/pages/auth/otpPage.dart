import 'dart:async';

import 'package:druto_seba_driver/src/pages/auth/registerUserInfoPage.dart';

import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/text/kText.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Timer? _timer;
  int _start = 59;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          color: primaryColor,
          child: Column(
            children: [
              AppBar(),
              Padding(
                padding: paddingH20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'যাচাই করুন',
                      fontSize: 18,
                      color: white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: paddingH20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KText(
                  text: 'যাচাই কোড প্রবেশ করুন',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                sizeH10,
                KText(
                  text: 'আমরা আপনার কোড সহ একটি কোড এসএমএস পাঠিয়েছি',
                  fontSize: 16,
                  color: black45,
                  textAlign: TextAlign.center,
                ),
                sizeH5,
                KText(
                  text: '+8801771282104',
                  fontSize: 16,
                  color: black45,
                  textAlign: TextAlign.center,
                ),
                sizeH10,
                OtpForm(),
                sizeH40,
                primaryButton(
                  buttonName: 'যাচাই করুন',
                  onTap: () => Get.to(() => RegisterUserInfoPage()),
                ),
                sizeH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'পুনরায় পাঠানো কোড:',
                      fontSize: 14,
                      color: black45,
                      textAlign: TextAlign.center,
                    ),
                    sizeW5,
                    _start == 0
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          super.widget));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: KText(
                                text: 'Resend Code',
                                color: primaryColor,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                text: '$_start',
                                fontSize: 16,
                                color: primaryColor,
                                textAlign: TextAlign.center,
                              ),
                              sizeW5,
                              KText(
                                text: 'sec',
                                fontSize: 16,
                                color: primaryColor,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _OtpFormState extends State<OtpForm> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final length = 4;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromARGB(255, 240, 240, 240);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 65,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: primaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
