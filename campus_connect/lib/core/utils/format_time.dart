import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTime(TimeOfDay time) {
  DateTime current = new DateTime.now();
  current = DateTime(
      current.year, current.month, current.day, time.hour, time.minute);
  DateFormat format = DateFormat.jm();
  return format.format(current);
}

String timePeriod(String date) {
  DateTime previousDate = DateTime.parse(date);
  Duration dif = DateTime.now().difference(previousDate);
  int dayDif = ((dif.inHours + 1) / 24).round();

  String res = '';
  int hour = previousDate.hour;
  String time =
      '  ${hour > 12 ? hour - 12 : hour}:${previousDate.minute < 10 ? '0${previousDate.minute}' : previousDate.minute} ${hour < 12 ? 'am' : (hour == 12 ? 'noon' : 'pm')}';
  if (dayDif < 1) {
    res = 'today $time';
  } else if (dayDif > 0 && dayDif < 2) {
    res = 'yesterday $time';
  } else {
    res = '$dayDif days ago $time';
  }
  return res;
}
