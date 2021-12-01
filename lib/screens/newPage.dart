import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New Page Contains Contents of login and sign up screen'),
              RaisedButton(
                child: Text("Log Out"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )        
            ],
          ),
        ),
      ),
    );
  }
}
