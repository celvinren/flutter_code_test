import 'package:dev_coding_test_calvin/ui/views/daily_summary_report/daily_summary_report_view.dart';
import 'package:dev_coding_test_calvin/ui/views/search_by_client_number/search_by_client_number_view.dart';
import 'package:dev_coding_test_calvin/ui/views/total_amount_by_product_and_day/total_amount_by_product_and_day_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Total per product",
                  ),
                  Tab(text: "Daily Report"),
                  Tab(text: "Search client"),
                ],
              ),
              title: Text('Demo'),
            ),
            body: TabBarView(
              children: [
                TotalAmountByProductAndDayView(),
                DailySummaryReportView(),
                SearchByClientNumberView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
