import 'package:flutter/material.dart';
import 'package:las_crew/core/route/route_paths.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Masuk',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField()
                ],
              ),
            ),
          ),

          //button masuk
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                //remove all prev routes
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutePaths.order, (route) => false);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text("Masuk"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
