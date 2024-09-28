import 'package:flutter/material.dart';
import 'package:las_crew/core/route/route_paths.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //formkey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //email controller and password controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //handle submit
  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //remove all prev routes
      Navigator.of(context).pushNamedAndRemoveUntil(
        RoutePaths.order,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
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
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                      ),
                      validator: (value) {
                        print(value);
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }

                        //validate email
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Email tidak valid';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        helper: Text('Password minimal 6 karakter'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),

            //button masuk
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () => _handleSubmit(context),
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
      ),
    );
  }
}
