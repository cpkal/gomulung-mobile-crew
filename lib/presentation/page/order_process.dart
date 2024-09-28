import 'package:flutter/material.dart';
import 'package:las_crew/presentation/widget/CustomAppbar.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderProcessPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Jl. Kaliurang KM 5, Sleman, Yogyakarta',
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //elevated button 'NAVIGASI'
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      openGoogleMap();
                    },
                    child: Text('NAVIGASI'),
                  ),
                ),
              ],
            ),
          ),
          //elevated button 'TINDAKAN'

          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  //border color primary
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                child: Icon(Icons.handyman_outlined),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {},
                  child: Text('SUDAH SAMPAI'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> openGoogleMap() async {
    final googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&destination=-6.946005,107.610537&travelmode=driving&dir_action=navigate";

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not open Google Maps.';
    }
  }
}
