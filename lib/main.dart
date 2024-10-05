import 'package:flutter/material.dart';
// import 'package:project_s6_mobile/screens/home_screen.dart';
// import 'package:project_s6_mobile/screens/admin_panel.dart';
import 'screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
