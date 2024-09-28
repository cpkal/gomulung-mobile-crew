import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/core/route/page_router.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/core/util/app_theme.dart';
import 'package:las_crew/presentation/bloc/app_bar/app_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/location_tracker/location_tracker_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarBloc>(
          create: (context) => BottomNavBarBloc(),
        ),
        BlocProvider<AppBarBloc>(
          create: (context) => AppBarBloc(),
        ),
        BlocProvider<LocationTrackerBloc>(
          create: (context) => LocationTrackerBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'LAS Crew',
        theme: appTheme(),
        initialRoute: RoutePaths.askLoginOrRegister,
        onGenerateRoute: PageRouter.generateRoute,
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
