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
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => model.pushToTotalAmountByProductAndDayPage(context), child: Text("Total amount by product and day")),
                ElevatedButton(onPressed: () => model.pushToSearchByClientNumberPage(context), child: Text("Search Client Number")),
                ElevatedButton(onPressed: () => model.pushToDailySummaryReportPage(context), child: Text("DailySummaryReport")),
              ],
            ),
          ),
        );
      },
    );
  }
}
