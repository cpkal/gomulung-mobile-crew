import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/core/util/secure_storage.dart';
import 'package:las_crew/presentation/bloc/auth/auth_bloc.dart';
import 'package:las_crew/presentation/page/ask_login_register.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  //secure storage
  final _secureStorage = new SecureStorage();

  @override
  void initState() {
    _secureStorage.readSecureData(key: 'token').then((s) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          //profile picture, edit profile button, logout button
          CircleAvatar(
            radius: 50,
            backgroundImage:
                Image.network('https://via.placeholder.com/150').image,
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
            onTap: () {
              context.read<AuthBloc>().add(AuthLogoutEvent());
              //remove all route go to
              Navigator.of(context)
                  .pushReplacementNamed(RoutePaths.askLoginOrRegister);
            },
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
