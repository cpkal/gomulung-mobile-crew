import 'package:flutter/material.dart';
import 'package:las_crew/core/util/secure_storage.dart';
import 'package:las_crew/presentation/page/orders.dart';
import 'package:las_crew/presentation/widget/CustomAppbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrderByCategories extends StatelessWidget {
  OrderByCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(18.0),
            //add shadow
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Pesanan',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),

                //icon buttons for filters
                IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {},
                ),
              ],
            )),

        //listview listtile
        Expanded(
            child: ListView(
          children: [
            ListTile(
              onTap: () {
                //navigate to detail page
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: OrderPage());
              },
              title: Text('Sampah terdekat'),
              trailing: Container(
                //circle shape
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('Sampah barang bekas'),
              trailing: Container(
                //circle shape
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('Sampah kertas'),
              trailing: Container(
                //circle shape
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('Sampah kardus'),
              trailing: Container(
                //circle shape
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
