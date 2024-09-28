import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('User 1'),
          subtitle: Text('Hello, how are you?'),
        ),
        ListTile(
          title: Text('User 2'),
          subtitle: Text('I am fine, thank you'),
        ),
        ListTile(
          title: Text('User 1'),
          subtitle: Text('What are you doing?'),
        ),
        ListTile(
          title: Text('User 2'),
          subtitle: Text('I am working'),
        ),
        ListTile(
          title: Text('User 1'),
          subtitle: Text('Good luck'),
        ),
        ListTile(
          title: Text('User 2'),
          subtitle: Text('Thank you'),
        ),
      ],
    );
  }
}
