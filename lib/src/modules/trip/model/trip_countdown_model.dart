import 'package:get/get.dart';

class CountdownItem {
  DateTime date;
  late RxInt countdown; // Using RxInt for reactive update

  CountdownItem({required this.date}) {
    countdown = RxInt((date.difference(DateTime.now()).inSeconds));
  }
  String formatCountdown(int seconds) {
    int days = seconds ~/ (24 * 3600);
    seconds = seconds % (24 * 3600);
    int hours = seconds ~/ 3600;
    seconds %= 3600;
    int minutes = seconds ~/ 60;
    seconds %= 60;

    return '$days d $hours h $minutes m $seconds s';
  }
}
