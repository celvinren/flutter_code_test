import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import './total_amount_by_product_and_day_view_model.dart';

class TotalAmountByProductAndDayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TotalAmountByProductAndDayViewModel>.reactive(
      viewModelBuilder: () => TotalAmountByProductAndDayViewModel(),
      onModelReady: (TotalAmountByProductAndDayViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TotalAmountByProductAndDayViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: BuildTotalAmountByProductAndDayTable(),
        );
      },
    );
  }
}

class BuildTotalAmountByProductAndDayTable extends HookViewModelWidget<TotalAmountByProductAndDayViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    Widget? table = useValueListenable(viewModel.getTable);
    return table ?? Container();
  }
}
