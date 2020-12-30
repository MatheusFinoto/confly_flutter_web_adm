import 'package:confly_web_adm/src/view/base/base_screen.dart';
import 'package:confly_web_adm/src/view/login/login_screen.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: BaseScreen()
    );
  }
}