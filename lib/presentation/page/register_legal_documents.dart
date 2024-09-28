import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:las_crew/core/route/route_paths.dart';

class RegisterLegalDocuments extends StatefulWidget {
  RegisterLegalDocuments({super.key});

  @override
  _RegisterLegalDocumentsState createState() => _RegisterLegalDocumentsState();
}

class _RegisterLegalDocumentsState extends State<RegisterLegalDocuments> {
  FilePickerResult? ktp, sim, stnk;
  String ktpText = "Upload";
  String simText = "Upload";
  String stnkText = "Upload";

  Future<void> _handlePickFileKTP() async {
    ktp = await FilePicker.platform.pickFiles();
    if (ktp != null) {
      setState(() {
        ktpText = "Terupload"; // Change button text to "Terupload"
      });
      print(ktp?.files.single.path);
    }
  }

  Future<void> _handlePickFileSIM() async {
    sim = await FilePicker.platform.pickFiles();
    if (sim != null) {
      setState(() {
        simText = "Terupload"; // Change button text to "Terupload"
      });
      print(sim?.files.single.path);
    }
  }

  Future<void> _handlePickFileSTNK() async {
    stnk = await FilePicker.platform.pickFiles();
    if (stnk != null) {
      setState(() {
        stnkText = "Terupload"; // Change button text to "Terupload"
      });
      print(stnk?.files.single.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Upload dokumen',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text('Upload dokumen legal anda'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text('KTP'),
                  trailing: ElevatedButton(
                    onPressed: _handlePickFileKTP,
                    child: Text(ktpText), // Show current button text
                  ),
                ),
                ListTile(
                  title: Text('SIM'),
                  trailing: ElevatedButton(
                    onPressed: _handlePickFileSIM,
                    child: Text(simText), // Show current button text
                  ),
                ),
                ListTile(
                  title: Text('STNK'),
                  trailing: ElevatedButton(
                    onPressed: _handlePickFileSTNK,
                    child: Text(stnkText), // Show current button text
                  ),
                ),
              ],
            ),
          ),

          // Button to register
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Remove all previous routes
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutePaths.order, (route) => false);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text("Daftarkan"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
