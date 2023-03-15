import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grazac_chat_app/screens/chat_screen.dart';
import 'package:grazac_chat_app/screens/login_screen.dart';
import 'package:grazac_chat_app/screens/registration_screen.dart';
import 'package:grazac_chat_app/screens/welcome_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  runApp(GrazacChat());
}

class GrazacChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
