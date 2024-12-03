import 'package:flutter/material.dart';
import 'package:las_crew/core/route/route_paths.dart';
import 'package:las_crew/presentation/page/ask_login_register.dart';
import 'package:las_crew/presentation/page/orders.dart';
import 'package:las_crew/presentation/page/login.dart';
import 'package:las_crew/presentation/page/order_by_categories.dart';
import 'package:las_crew/presentation/page/order_process.dart';
import 'package:las_crew/presentation/page/register.dart';
import 'package:las_crew/presentation/page/register_legal_documents.dart';
import 'package:las_crew/presentation/page/sub_root.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.order:
        return MaterialPageRoute(builder: (_) => SubRootPage());
      case RoutePaths.askLoginOrRegister:
        return MaterialPageRoute(builder: (_) => AskLoginRegisterPage());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case RoutePaths.registerUploadLegalDocuments:
        final args =
            settings.arguments as Map<String, dynamic>?; // Get the arguments
        return MaterialPageRoute(
          builder: (context) => RegisterLegalDocuments(
            name: args?['name'],
            phone_number: args?['phone_number'],
            address: args?['address'],
            email: args?['email'],
            password: args?['password'],
          ),
        );
      case RoutePaths.orderProcess:
        return MaterialPageRoute(builder: (_) => OrderProcessPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
