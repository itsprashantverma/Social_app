import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Constants/constants.dart';
import 'package:social_app/Landing%20Page/landing_page.dart';
import 'package:social_app/Profile/upload_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: kTertiaryColor,
          ),
        ),
        primaryColor: Colors.black,
      ),
      home: LoadingScreen(),
    );
  }
}
