import 'package:flutter/material.dart';




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
