import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../view_model/lecturer.dart";
import "../view_model/lesson.dart";

final List<Lecturer> lecturerMockDataList = [
  Lecturer(name: "Albert Flores", jobTitle: "Demonstrator", profilePicture: "assets/albert_flores.png", lessonList: [
    Lesson(
        lessonName: "基礎程式設計",
        weekDay: "每週二",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂基礎程式設計課程"),
    Lesson(
        lessonName: "人工智慧總整與實作",
        weekDay: "每週四",
        lessonStartTime: const TimeOfDay(hour: 14, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 16, minute: 0),
        lessonDescription: "這是一堂基礎人工智慧課程"),
    Lesson(
        lessonName: "訊號與系統",
        weekDay: "每週五",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂基礎訊號與系統課程")
  ]),
  Lecturer(name: "Floyd Miles", jobTitle: "Lecturer", profilePicture: "assets/floyd_miles.jpg", lessonList: [
    Lesson(
        lessonName: "線性代數",
        weekDay: "每週二",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂線性代數課程"),
    Lesson(
        lessonName: "電力電子",
        weekDay: "每週四",
        lessonStartTime: const TimeOfDay(hour: 14, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 16, minute: 0),
        lessonDescription: "這是一堂電力電子課程"),
    Lesson(
        lessonName: "微處理機",
        weekDay: "每週五",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂微處理機課程")
  ]),
  Lecturer(name: "Savannah Nguyen", jobTitle: "Senior Lecturer", profilePicture: "assets/savannah_nguyen.jpg", lessonList: [
    Lesson(
        lessonName: "自動控制",
        weekDay: "每週二",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂自動控制課程"),
    Lesson(
        lessonName: "工程數學",
        weekDay: "每週四",
        lessonStartTime: const TimeOfDay(hour: 14, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 16, minute: 0),
        lessonDescription: "這是一堂工程數學課程"),
    Lesson(
        lessonName: "電子學",
        weekDay: "每週五",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂電子學課程")
  ]),
  Lecturer(name: "Jenny Wilson", jobTitle: "Professor", profilePicture: "assets/jenny_wilson.jpg", lessonList: [
    Lesson(
        lessonName: "數位邏輯",
        weekDay: "每週二",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂數位邏輯課程"),
    Lesson(
        lessonName: "離散數學",
        weekDay: "每週四",
        lessonStartTime: const TimeOfDay(hour: 14, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 16, minute: 0),
        lessonDescription: "這是一堂離散數學課程"),
    Lesson(
        lessonName: "電力系統",
        weekDay: "每週五",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂電力系統課程")
  ]),

  Lecturer(name: "Neil Leveridge", jobTitle: "Professor", profilePicture: "assets/neil_leveridge.jpg", lessonList: [
    Lesson(
        lessonName: "視窗程式設計",
        weekDay: "每週二",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂視窗程式設計課程"),
    Lesson(
        lessonName: "感測網路與實務",
        weekDay: "每週四",
        lessonStartTime: const TimeOfDay(hour: 14, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 16, minute: 0),
        lessonDescription: "這是一堂感測網路與實務課程"),
    Lesson(
        lessonName: "微積分",
        weekDay: "每週五",
        lessonStartTime: const TimeOfDay(hour: 10, minute: 0),
        lessonEndTime: const TimeOfDay(hour: 12, minute: 0),
        lessonDescription: "這是一堂微積分課程")
  ]),
];

class LecturerStateNotifier extends StateNotifier<AsyncValue< List<Lecturer> >> {


  LecturerStateNotifier() : super(const AsyncLoading()) {


    state = AsyncValue.data(lecturerMockDataList);
  }
}
