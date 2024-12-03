import 'package:flutter/material.dart';
import 'package:las_crew/presentation/page/order_detail.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrderCard extends StatelessWidget {
  final orderAddress;
  final orderDistance;
  final trashType;
  final weightEstimation;
  const OrderCard(
      {Key? key,
      required this.orderAddress,
      required this.orderDistance,
      required this.trashType,
      required this.weightEstimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
            Text(orderAddress)
          ],
        ),
        subtitle: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Text(orderDistance),
              Text(trashType),
              Text(weightEstimation)
            ],
          ),
        ),
      ),
    );
  }
}
