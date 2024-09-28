import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //profile picture, edit profile button, logout button
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(height: 10),
        Text('John Doe'),
        SizedBox(height: 10),
      ],
    );
  }
}
