import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheather_api_cubit_bloc/home.dart';
import 'package:wheather_api_cubit_bloc/search.dart';
import 'package:wheather_api_cubit_bloc/setting.dart';

class MyRoutes {
  static String home = "/";
  static String searching = "/search";
  static String setting = "/setting";

  late final GoRouter router;

  MyRoutes() {
    router = GoRouter(
      routes: [
        GoRoute(  
            name: MyRoutes.home,
            path: MyRoutes.home,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;
              return HomePage(
                data: data,
              );
            }),
        GoRoute(
          name: MyRoutes.searching,
          path: MyRoutes.searching,
          builder: (context, state) => SearchPage(),
        ),
        GoRoute(
          name: MyRoutes.setting,
          path: MyRoutes.setting,
          builder: (context, state) => SettingPage(),
        ),
      ],
      errorBuilder: (context, state) {
        return Text("Error: ${state.error}");
      },
    );
  }
}
