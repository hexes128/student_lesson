import 'package:flutter/material.dart';

class Lesson {
  String lessonName;
  String weekDay;
  TimeOfDay lessonStartTime;
  TimeOfDay lessonEndTime;

  Lesson({required this.lessonName, required this.weekDay, required this.lessonStartTime, required this.lessonEndTime});
}
