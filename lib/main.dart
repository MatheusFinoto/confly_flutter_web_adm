import 'package:confly_web_adm/src/view/login/login_screen.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: GLOBAL.ORANGE,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: LoginScreen()
    );
  }
}