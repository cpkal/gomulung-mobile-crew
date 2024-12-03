import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/core/route/page_router.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/core/util/app_theme.dart';
import 'package:las_crew/core/util/secure_storage.dart';
import 'package:las_crew/data/datasource/remote/websocket_service.dart';
import 'package:las_crew/presentation/bloc/app_bar/app_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/auth/auth_bloc.dart';
import 'package:las_crew/presentation/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:las_crew/presentation/bloc/location_tracker/location_tracker_bloc.dart';
import 'package:las_crew/presentation/bloc/websocket/websocket_bloc.dart';

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

  final _secureStorage = SecureStorage();
  late Future<WebSocketService> _websocketServiceFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _websocketServiceFuture = _initializeWebSocketService();
  }

  Future<WebSocketService> _initializeWebSocketService() async {
    // Wait for the token to be fetched, then create the WebSocketService
    final token = await _secureStorage.readSecureData(key: 'token');
    return WebSocketService('ws://10.0.2.2:3000/socket?token=$token&role=crew');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebSocketService>(
      future: _websocketServiceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        final websocketService = snapshot.data!;

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
          BlocProvider<WebsocketBloc>(
            create: (context) => WebsocketBloc(websocketService),
          ),
        ], child: RootPage());
      },
    );
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
