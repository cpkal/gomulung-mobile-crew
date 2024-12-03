import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/presentation/bloc/websocket/websocket_bloc.dart';
import 'package:las_crew/presentation/page/order_detail.dart';
import 'package:las_crew/presentation/widget/CustomAppbar.dart';
import 'package:las_crew/presentation/widget/order_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchOrderList();
  }

  void _fetchOrderList() {
    final get_orders = {
      "event": "get_orders",
    };

    context.read<WebsocketBloc>().add(WebsocketSend(jsonEncode(get_orders)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //containers
        Expanded(
          child: ListView(
            children: [
              OrderCard(
                orderAddress: 'X',
                orderDistance: 'X',
                trashType: 'X',
                weightEstimation: 'X',
              ),
              SizedBox(
                height: 20,
              ),
              OrderCard(
                orderAddress: 'X',
                orderDistance: 'X',
                trashType: 'X',
                weightEstimation: 'X',
              ),
              SizedBox(
                height: 20,
              ),
              OrderCard(
                orderAddress: 'X',
                orderDistance: 'X',
                trashType: 'X',
                weightEstimation: 'X',
              ),
            ],
          ),
        )
      ],
    );
  }
}
