import 'package:flutter/material.dart';

import '../build_input.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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
              inputKeyboard: TextInputType.text,
              maskText: false,
              inputController: _firstNameController,
              onChanged: (value) {},
              hint: 'Enter first name',
            ),
            SizedBox(
              height: 8.0,
            ),
            BuildGeneralInput(
              inputKeyboard: TextInputType.text,
              maskText: false,
              inputController: _lastNameController,
              onChanged: (value) {},
              hint: 'Enter last name',
            ),
            SizedBox(
              height: 8.0,
            ),
            BuildGeneralInput(
              inputKeyboard: TextInputType.emailAddress,
              maskText: false,
              inputController: _emailController,
              onChanged: (value) {},
              hint: 'Enter email',
            ),
            SizedBox(
              height: 8.0,
            ),
            BuildGeneralInput(
              inputKeyboard: TextInputType.text,
              maskText: true,
              inputController: _passwordController,
              onChanged: (value) {},
              hint: 'Enter password',
            ),
            SizedBox(
              height: 8.0,
            ),
            
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Implement registration functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
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

