import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  final controller;

  const OtpForm({super.key, required this.controller});
  @override
  _OtpFormState createState() => _OtpFormState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _OtpFormState extends State<OtpForm> {

  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller.dispose();
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
        controller: widget.controller,
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