import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task4_signin/screens/signIn.dart';

import 'newPage.dart';

//Sign Up Page...Contains Login and Signup Switcher,Email and Password Textfield and Login Button
class SignUp extends StatefulWidget {
  @override
  _SignUpBarState createState() => _SignUpBarState();
}

class _SignUpBarState extends State<SignUp> {
  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Sign Up /SignIn Switcher Feature
        Container(
          height: 38.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(40, 1, 40, 1),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Text("Login"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(40, 1, 40, 1),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                ),
              ),
            ],
          ),
        ),
        //SignUp Email and Password Feature
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Email
              TextField(
                onChanged: (value) {
                  email = value;
                  print(email);
                },
                decoration: InputDecoration(labelText: "Enter your Mail"),
              ),
              //Password
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.orange),
              ),
              //SignUp Button
              Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 50.0),
                height: 40.0,
                width: double.infinity,
                child: TextButton(
                  child: Text("Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        print('New Page');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NewPage()));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
