import 'lesson.dart';

class Lecturer {
  String name;
  String jobTitle;
  String profilePicture;
  List<Lesson> lessonList;

  Lecturer({required this.name, required this.jobTitle, required this.profilePicture, required this.lessonList});
}