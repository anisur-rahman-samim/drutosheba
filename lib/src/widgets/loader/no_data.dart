import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/no-data.json'),
    );
  }
}
