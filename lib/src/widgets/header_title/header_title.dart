import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTitle extends StatefulWidget {
  final String title;
  const HeaderTitle({super.key, required this.title});

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Container(
            height: 1.7,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, Colors.green], // Customize gradient colors
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.0),
      ],
    );

  }
}