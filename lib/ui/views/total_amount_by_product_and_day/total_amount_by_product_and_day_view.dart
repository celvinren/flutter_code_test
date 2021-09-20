import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

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
          appBar: AppBar(
            title: Text("Total Amount for product and day"),
          ),
          body: BuildTotalAmountByProductAndDayTable(),
        );
      },
    );
  }
}

class BuildTotalAmountByProductAndDayTable extends HookViewModelWidget<TotalAmountByProductAndDayViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    Map resultMap = useValueListenable(viewModel.getTotalResultMap);
    List<Widget> headerList = [];
    resultMap.forEach((key, value) {
      List<CellInfo> titleList = [
        CellInfo("Produc Group Code", 150, filterName: Transaction.productGroupCodeStr),
        CellInfo("Exchange Code", 150, filterName: Transaction.exchangeCodeStr),
        CellInfo("Symbol", 100, filterName: Transaction.symbolStr),
        CellInfo("Transaction Total Price", 170, filterName: Transaction.transactionPriceStr),
      ];

      List<Transaction> resultList = [];
      (value as Map).forEach((key, value) {
        List<String> keyList = (key as String).split("+");
        resultList.add(Transaction()
          ..productGroupCode = keyList[0]
          ..exchangeCode = keyList[1]
          ..symbol = keyList[2]
          ..transactionPrice = (currencyFormat.format(value)).toString());
      });
      var table = HorizontalTable(resultList, titleList);
      headerList.add(
        Container(
          height: 50.h,
          color: Colors.blueGrey[700],
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.centerLeft,
          child: Text(
            '${datetimeFormat.format(key)}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
      headerList.add(
        Expanded(flex: 2, child: table),
      );

      // StickyHeader(
      //   key: Key(controller.hashCode.toString()),
      //   controller: controller,
      //   header: Container(
      //     height: 50.h,
      //     color: Colors.blueGrey[700],
      //     padding: EdgeInsets.symmetric(horizontal: 16.w),
      //     alignment: Alignment.centerLeft,
      //     child: Text(
      //       '${datetimeFormat.format(key)}',
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //   ),
      //   content: table
      //   // StatefulBuilder(
      //   //   builder:
      //   //   (BuildContext context, StateSetter setState) {
      //   //     reture

      //   //     // List<Widget> contentList = [];
      //   //     // (value as Map).forEach((k, v) {
      //   //     //   contentList.add(Row(
      //   //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //     //     children: [
      //   //     //       Container(padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w), child: Text(k)),
      //   //     //       Container(
      //   //     //           padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w), child: Text((currencyFormat.format(v)).toString())),
      //   //     //     ],
      //   //     //   ));
      //   //     // });
      //   //     // return Column(
      //   //     //   children: contentList,
      //   //     // );
      //   //   },
      //   // ),
      //   ),
    });
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: headerList);
  }
}
