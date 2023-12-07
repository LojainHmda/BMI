import 'package:flutter/material.dart';
import 'Screens/home_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "project bmi",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xff0A0E21),
          appBarTheme: const AppBarTheme(color: Color(0xff1A1E38),titleTextStyle: TextStyle(color: Colors.white),centerTitle: true,iconTheme:IconThemeData(color: Colors.white)) ),
      home: const HomePage(),
    );
  }
}
