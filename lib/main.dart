import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abbey Foods',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
      ),
      home: SignInPage(),
    );
  }
}

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
                    Image.asset('images/logo.png'),
                    SizedBox(height: 30.0), //logo
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
          SignUpBar(),
          EmailBar(),
          LoginButton(),
          ContinueDivider(),
          SocialIcons(),
        ],
      ),
    );
  }
}

//Login and Signup Switcher
class SignUpBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              child: Text("Log In", style: TextStyle(color: Colors.white)),
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
              child: Text("Sign Up"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(40, 1, 40, 1),
                ),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class EmailBar extends StatelessWidget {
  //Email and Password Textfield
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration:
                InputDecoration(labelText: "Enter your Mail or Username"),
          ),
          TextField(
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
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  //Login Button
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {},
      ),
    );
  }
}

class ContinueDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(color: Colors.grey),
          ),
          SizedBox(width: 10.0),
          Text('or continue with',
              style: TextStyle(color: Colors.grey[500], fontSize: 15.0)),
          SizedBox(width: 10.0),
          Expanded(
            child: Divider(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.all(15),
            color: Colors.blueAccent,
            icon: Image.asset('images/G.png'), //google icon
            iconSize: 30,
            onPressed: () {}),
        IconButton(
            padding: const EdgeInsets.all(15),
            color: Colors.blueAccent,
            icon: Image.asset('images/twit.png'), //twitter icon
            iconSize: 30,
            onPressed: () {}),
        IconButton(
            padding: const EdgeInsets.all(15),
            color: Colors.orange,
            icon: Image.asset('images/F.png'), //facebook icon

            iconSize: 30,
            onPressed: () {}),
      ],
    );
  }
}
