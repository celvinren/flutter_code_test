import 'package:auto_route/auto_route.dart';
import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/router/router.gr.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  pushToSearchByClientNumberPage(BuildContext context) {
    AutoRouter.of(context).push(SearchByClientNumberRoute());
  }

  pushToTotalAmountByProductAndDayPage(BuildContext context) {
    AutoRouter.of(context).push(TotalAmountByProductAndDayRoute());
  }
}
