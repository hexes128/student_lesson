import 'package:flutter/material.dart';

class Lesson {
  String lessonName;
  String weekDay;
  String lessonDescription;
  TimeOfDay lessonStartTime;
  TimeOfDay lessonEndTime;

  Lesson({required this.lessonName, required this.weekDay, required this.lessonStartTime, required this.lessonEndTime,required this.lessonDescription});
}
