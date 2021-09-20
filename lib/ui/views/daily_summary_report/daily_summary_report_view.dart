import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:dropdown_search/dropdown_search.dart';

import './daily_summary_report_view_model.dart';

class DailySummaryReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DailySummaryReportViewModel>.reactive(
      viewModelBuilder: () => DailySummaryReportViewModel(),
      onModelReady: (DailySummaryReportViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DailySummaryReportViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                DropdownSearch<String>(
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF01689A)),
                        ),
                        contentPadding: EdgeInsets.only(left: 15)),
                    items: model.datetimeList,
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: (data) {
                      model.setSelectedDateTime(data!);
                    },
                    showSearchBox: false,
                    dropdownSearchBaseStyle: TextStyle(color: Colors.white),
                    selectedItem: model.datetimeList[0]),
                Expanded(flex: 5, child: BuildDailySummaryReportTable()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildDailySummaryReportTable extends HookViewModelWidget<DailySummaryReportViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    List<Transaction> resultList = useValueListenable(viewModel.getDisplayResultList);
    var table = HorizontalTableNormal(searchResultList: resultList, titleList: viewModel.titleList);
    return table;
  }
}
