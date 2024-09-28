import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/presentation/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:las_crew/presentation/page/order_process.dart';
import 'package:las_crew/presentation/page/sub_root.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

//only text

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // First container with 1/3 of the screen height
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Text(
                'Container 1 (1/3 height)',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          // Second container that takes the remaining space
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pemesan, Santoso'),
                        Text(
                          'Rp16.000',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Tunai',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Jarak'),
                                  Text('1.5 km'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Estimasi tiba'),
                                  Text('10 menit'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Berat sampah'),
                                  Text('kecil < 5kg'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        // Take order
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, RoutePaths.subRoot, (route) => false);
                        context.read<BottomNavBarBloc>().add(
                              UpdateBottomNavBarEvent(index: 1),
                            );
                        PersistentNavBarNavigator
                            .popUntilFirstScreenOnSelectedTabScreen(context);
                      },
                      child: Text('Ambil Order'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
