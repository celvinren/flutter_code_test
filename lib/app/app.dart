import 'package:flutter/material.dart';
    import 'package:dev_coding_test_calvin/app/locator/locator.dart';
    import 'package:dev_coding_test_calvin/app/services/router_service.dart';

class DevCodingTestCalvinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      title: "DevCodingTestCalvin",
      routeInformationParser: _routerService.router.defaultRouteParser(),
      routerDelegate: _routerService.router.delegate(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}