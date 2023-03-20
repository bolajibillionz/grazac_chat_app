import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grazac_chat_app/screens/chat_screen.dart';
import 'package:grazac_chat_app/screens/login_screen.dart';
import 'package:grazac_chat_app/screens/registration_screen.dart';
import 'package:grazac_chat_app/screens/welcome_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //the app for class

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => 
    
     GrazacChat()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class GrazacChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('An error has occur'),
              );
            } else if (snapshot.hasData) {
              return ChatScreen();
            } else {
              return WelcomeScreen();
            }
          }),
    );
  }
}
