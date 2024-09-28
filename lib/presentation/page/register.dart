import 'package:flutter/material.dart';
import 'package:las_crew/core/route/route_paths.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //formkey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //name, email, phone number, password, and address controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  //handle submit
  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //remove all prev routes
      Navigator.pushNamed(context, RoutePaths.registerUploadLegalDocuments);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Daftar',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('Isi data diri anda'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //name
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        hintText: 'Masukkan nama',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //phone number
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Nomor Whatsapp',
                        hintText: 'Masukkan nomor telepon',
                        helper: Text('Pastikan nomor terdaftar di Whatsapp'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nomor telepon tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //address
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        hintText: 'Masukkan alamat',
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Akun',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('Isi data akun anda'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //email
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      //password
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                  _handleSubmit(context);
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
      ),
    );
  }
}
