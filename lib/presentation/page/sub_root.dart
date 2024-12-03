import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/presentation/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/location_tracker/location_tracker_bloc.dart';
import 'package:las_crew/presentation/bloc/websocket/websocket_bloc.dart';
import 'package:las_crew/presentation/page/chat.dart';
import 'package:las_crew/presentation/page/orders.dart';
import 'package:las_crew/presentation/page/myaccount.dart';
import 'package:las_crew/presentation/page/order_by_categories.dart';
import 'package:las_crew/presentation/page/order_process.dart';
import 'package:las_crew/presentation/widget/CustomAppbar.dart';
import 'package:latlong2/latlong.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SubRootPage extends StatefulWidget {
  SubRootPage();

  @override
  _SubRootPageState createState() => _SubRootPageState();
}

class _SubRootPageState extends State<SubRootPage> {
  _SubRootPageState();

  bool wsAlreadyConnected = false;

  @override
  void initState() {
    //run first
    context.read<LocationTrackerBloc>().add(GetPermission());

    // TODO: implement initState
    super.initState();
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationTrackerBloc, LocationTrackerState>(
        listener: (context, state) {
          if (state is PermissionGranted) {
            context.read<LocationTrackerBloc>().add(StartTracking());
          } else if (state is LocationChanged) {
            if (!wsAlreadyConnected) {
              context.read<WebsocketBloc>().add(WebsocketConnect());
            }
          }
        },
        child: BlocConsumer<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              final driver = {
                "event": "register_crew",
                "data": {
                  "id": 1,
                  "location": {
                    "lat": context.read<LocationTrackerBloc>().state.latitude,
                    "long": context.read<LocationTrackerBloc>().state.longitude
                  }
                }
              };

              context
                  .read<WebsocketBloc>()
                  .add(WebsocketSend(jsonEncode(driver)));
            } else if (state is WebsocketReceived) {
              final data = jsonDecode(state.message);
              if (data['event'] == 'new_order') {
                print(data);
              }
            }
          },
          builder: (context, state) {
            return BlocConsumer<BottomNavBarBloc, BottomNavBarState>(
              listener: (context, state) {
                _controller.index = state.currentIndex;
              },
              builder: (context, state) {
                return Scaffold(
                  appBar: CustomAppBar.build(context, 'LAS'),
                  body: PersistentTabView(
                    context,
                    controller: _controller,
                    screens: _buildScreens(),
                    items: _navBarsItems(context),
                    handleAndroidBackButtonPress: true, // Default is true.
                    resizeToAvoidBottomInset:
                        true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
                    stateManagement: true, // Default is true.
                    hideNavigationBarWhenKeyboardAppears: true,
                    // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
                    padding: const EdgeInsets.only(top: 8),
                    backgroundColor: Colors.white,
                    isVisible: true,
                    animationSettings: const NavBarAnimationSettings(
                      navBarItemAnimation: ItemAnimationSettings(
                        // Navigation Bar's items animation properties.
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease,
                      ),
                      screenTransitionAnimation:
                          ScreenTransitionAnimationSettings(
                        // Screen transition animation on change of selected tab.
                        animateTabTransition: true,
                        duration: Duration(milliseconds: 200),
                        screenTransitionAnimationType:
                            ScreenTransitionAnimationType.fadeIn,
                      ),
                    ),
                    confineToSafeArea: true,
                    navBarHeight: kBottomNavigationBarHeight,
                    navBarStyle: _navBarStyle,
                  ),
                );
              },
            );
          },
        ));
  }
}

List<Widget> _buildScreens() {
  return [
    OrderPage(),
    OrderProcessPage(),
    ChatPage(),
    MyAccountPage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.pin_drop),
      inactiveIcon: Icon(Icons.pin_drop_outlined),
      title: ("Order"),
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveColorPrimary: Theme.of(context).colorScheme.onSurface,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.map),
      inactiveIcon: Icon(Icons.map_outlined),
      title: ("Proses"),
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveColorPrimary: Theme.of(context).colorScheme.onSurface,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.chat),
      inactiveIcon: Icon(Icons.chat_outlined),
      title: ("Chat"),
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveColorPrimary: Theme.of(context).colorScheme.onSurface,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      inactiveIcon: Icon(Icons.person_outline),
      title: ("Akun"),
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveColorPrimary: Theme.of(context).colorScheme.onSurface,
    ),
  ];
}

NavBarStyle _navBarStyle =
    NavBarStyle.style3; // Choose the nav bar style with this property
