import 'package:flutter/material.dart';

//Line Demarcation showing "continue with"
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
