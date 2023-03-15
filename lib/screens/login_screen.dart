import 'package:flutter/material.dart';
import 'package:grazac_chat_app/build_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/grazac.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            BuildGeneralInput(
                inputController: _emailController,
                hint: 'Enter your email',
                maskText: false,
                inputKeyboard: TextInputType.emailAddress,
                onChanged: (value) {}),
            SizedBox(
              height: 8.0,
            ),
            BuildGeneralInput(
                inputController: _passwordController,
                hint: 'Enter your password',
                maskText: true,
                inputKeyboard: TextInputType.text,
                onChanged: (value) {}),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
