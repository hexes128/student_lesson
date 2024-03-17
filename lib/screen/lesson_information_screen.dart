import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_model/lesson.dart';

class LessonInformationScreen extends HookConsumerWidget {
  final DefaultMaterialLocalizations timeOfDayFormatter;

  const LessonInformationScreen({super.key, required this.lesson, this.timeOfDayFormatter = const DefaultMaterialLocalizations()});

  final Lesson lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("課程資訊"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              readOnly: true,
              enableInteractiveSelection: false,
              initialValue: lesson.lessonName,
              decoration: const InputDecoration(
                  isDense: true,
                  labelText: "課程名稱",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              readOnly: true,
              enableInteractiveSelection: false,
              initialValue:
                  "${lesson.weekDay}, ${timeOfDayFormatter.formatTimeOfDay(lesson.lessonStartTime, alwaysUse24HourFormat: true)}~${timeOfDayFormatter.formatTimeOfDay(lesson.lessonEndTime, alwaysUse24HourFormat: true)}",
              decoration: const InputDecoration(
                  isDense: true,
                  labelText: "上課時間",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              readOnly: true,
              enableInteractiveSelection: false,
              initialValue: lesson.lessonDescription,
              decoration: const InputDecoration(
                  isDense: true,
                  labelText: "課程描述",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
