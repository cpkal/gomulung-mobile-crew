import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/core/route/page_router.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/core/util/app_theme.dart';
import 'package:las_crew/presentation/bloc/app_bar/app_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/auth/auth_bloc.dart';
import 'package:las_crew/presentation/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/location_tracker/location_tracker_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BottomNavBarBloc>(
        create: (context) => BottomNavBarBloc(),
      ),
      BlocProvider<AppBarBloc>(
        create: (context) => AppBarBloc(),
      ),
      BlocProvider<LocationTrackerBloc>(
        create: (context) => LocationTrackerBloc(),
      ),
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
      ),
    ], child: RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthCheckEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return MaterialApp(
          title: 'LAS Crew',
          theme: appTheme(),
          initialRoute: state is AuthAuthenticated
              ? RoutePaths.order
              : RoutePaths.askLoginOrRegister,
          onGenerateRoute: PageRouter.generateRoute,
          navigatorObservers: [routeObserver],
        );
      },
    );
  }
}
