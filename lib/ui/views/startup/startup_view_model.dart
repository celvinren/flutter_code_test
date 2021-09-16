import 'package:flutter/material.dart';
import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';
import 'package:dev_coding_test_calvin/app/router/router.dart';
import 'package:dev_coding_test_calvin/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  Future<void> init() async {
    WidgetsBinding.instance!.addPostFrameCallback((Duration duration) async {
      await navigateToHomeView();
    });
  }

  Future navigateToHomeView() async {
    await _routerService.router.push(
      HomeRoute(),
    );
  }
}