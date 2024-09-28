import 'package:flutter/material.dart';
import 'package:las_crew/presentation/page/order_detail.dart';
import 'package:las_crew/presentation/widget/CustomAppbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FilteredOrder extends StatelessWidget {
  const FilteredOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar.build(context, 'Order List'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //containers
          Expanded(
            child: ListView(
              children: [
                Container(
                  //left border
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 5,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      //navigate to detail page
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: OrderDetailPage());
                    },
                    title: Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Jl. Kaliurang KM 5, Sleman, Yogyakarta')
                      ],
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text('1.5 km | '),
                          Text('Sampah rumahan | '),
                          Text('< 5kg (kurang dari 5kg)')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //left border
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 5,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      //navigate to detail page
                    },
                    title: Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Jl. Kaliurang KM 5, Sleman, Yogyakarta')
                      ],
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text('1.5 km | '),
                          Text('Sampah rumahan | '),
                          Text('< 5kg (kurang dari 5kg)')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //left border
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 5,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      //navigate to detail page
                    },
                    title: Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Jl. Kaliurang KM 5, Sleman, Yogyakarta')
                      ],
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text('1.5 km | '),
                          Text('Sampah rumahan | '),
                          Text('< 5kg (kurang dari 5kg)')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
