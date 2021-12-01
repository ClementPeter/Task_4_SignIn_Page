import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/continueDivider.dart';
import '../components/socialIcons.dart';

//User Sign-In Page

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.png'), fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    Image.asset('images/logo.png'),
                    LoginDetails(), //the widget that contains the whole login in or sign up details
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          SignIn(),
          ContinueDivider(),
          SocialIcons(),
        ],
      ),
    );
  }
}

//Login and Signup Switcher
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  child:
                      Text("Sign Up", style: TextStyle(color: Colors.orange)),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(40, 1, 40, 1)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Text("Login", style: TextStyle(color: Colors.white)),
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
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                  print(email);
                },
                decoration:
                    InputDecoration(labelText: "Enter your Mail or Username"),
              ),
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

              //Login Button
              Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 50.0),
                height: 40.0,
                width: double.infinity,
                child: TextButton(
                  child: Text("Login",
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
                      final loginUser = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (loginUser != null) {
                        print('New Page');
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
