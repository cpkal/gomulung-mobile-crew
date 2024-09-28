import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          //profile picture, edit profile button, logout button
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(height: 10),
          Text('John Doe'),
          SizedBox(height: 10),
          //listtile menus
          ListTile(
            title: Text('Edit Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
