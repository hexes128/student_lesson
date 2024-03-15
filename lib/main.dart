import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  MyHomePage({super.key});

  final List<Lecturer> lecturerList = [
    Lecturer(name: "Albert Flores",jobTitle: "Demonstrator",profilePicture: "assets/albert_flores.png"),
    Lecturer(name: "Floyd Miles",jobTitle: "Lecturer",profilePicture: "assets/floyd_miles.jpg"),
    Lecturer(name: "Savannah Nguyen",jobTitle: "Senior Lecturer",profilePicture: "assets/jenny_wilson.jpg"),
    Lecturer(name: "Jenny Wilson",jobTitle: "Professor",profilePicture: "assets/neil_leveridge.jpg"),
    Lecturer(name: "Neil Leveridge",jobTitle: "Professor",profilePicture: "assets/savannah_nguyen.jpg"),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: ListView.builder(itemCount: lecturerList.length, itemBuilder: (context, index) {

      return ExpansionTile(title: ListTile(leading: CircleAvatar(
        backgroundImage: AssetImage(lecturerList[index].profilePicture), 
      ) ,));
    }));
  }
}

class Lecturer {
  String name;
  String jobTitle;
  String profilePicture;

  Lecturer({required this.name, required this.jobTitle, required this.profilePicture});
}
