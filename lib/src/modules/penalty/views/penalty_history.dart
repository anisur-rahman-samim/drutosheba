import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';

class PenaltyHistoryView extends StatelessWidget {
  const PenaltyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("পেনাল্টি হিস্ট্রি",style: h2,),),
    );
  }
}
