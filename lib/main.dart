import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:student_lesson/provider/lecturer_lesson_provider.dart';
import 'package:student_lesson/screen/lesson_information_screen.dart';
import 'package:student_lesson/view_model/lecturer.dart';
import 'package:student_lesson/view_model/lesson.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => MyHomePage(), routes: [
            GoRoute(
              path: 'lesson_information_screen',
              name: 'lesson_information_screen',
              builder: (context, state) => LessonInformationScreen(
                lesson: state.extra as Lesson,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  final StateNotifierProvider<LecturerStateNotifier, AsyncValue<List<Lecturer>>> lecturerProvider;

  MyHomePage({super.key}) : lecturerProvider = StateNotifierProvider<LecturerStateNotifier, AsyncValue<List<Lecturer>>>((ref) => LecturerStateNotifier());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonIsExpanded = useState(false); //check if user expands the lesson list from lecturer

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_outlined),
          title: const Text("講師清單"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ref.watch(lecturerProvider).when(data: (lecturerList) {
            return ListView.builder(
                itemCount: lecturerList.length,
                itemBuilder: (context, index) {
                  final lecturer = lecturerList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: ExpansionTile(
                      trailing: lessonIsExpanded.value ? const Icon(Icons.remove) : const Icon(Icons.add),
                      shape: const Border(),
                      title: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(lecturer.profilePicture),
                        ),
                        title: Text(
                          lecturer.jobTitle,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        subtitle: Text(
                          lecturer.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      children: [
                        const Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        ...lecturer.lessonList.map((e) => LessonListTile(lesson: e))
                      ],
                      onExpansionChanged: (expanded) {
                        lessonIsExpanded.value = expanded;
                      },
                    ),
                  );
                });
          }, error: (e, s) {
            return const Text("錯誤");
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}

class LessonListTile extends StatelessWidget {
  final DefaultMaterialLocalizations timeOfDayFormatter;

  final Lesson lesson;

  const LessonListTile({super.key, required this.lesson, this.timeOfDayFormatter = const DefaultMaterialLocalizations()});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.calendar_month),
      title: Text(lesson.lessonName),
      subtitle: Text(
        "${lesson.weekDay}, ${timeOfDayFormatter.formatTimeOfDay(lesson.lessonStartTime, alwaysUse24HourFormat: true)}~${timeOfDayFormatter.formatTimeOfDay(lesson.lessonEndTime, alwaysUse24HourFormat: true)}",
      ),
      trailing: IconButton(
        icon: const Icon(Icons.navigate_next),
        onPressed: () {
          context.pushNamed("lesson_information_screen", extra: lesson);
        },
      ),
      onTap: () {
        context.pushNamed("lesson_information_screen", extra: lesson);
      },
    );
  }
}
