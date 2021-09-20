import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalTableNormal extends HorizontalTable {
  HorizontalTableNormal({
    required List<Transaction>? searchResultList,
    required List<CellInfo> titleList,
  }) : super(searchResultList: searchResultList, titleList: titleList);

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: List.generate(
          titleList.length,
          (i) => HorizontalTable.getCellItemWidget(
              searchResultList != null
                  ? (searchResultList![index].toJson()[titleList[i].filterName] is DateTime
                      ? datetimeFormat.format(searchResultList![index].toJson()[titleList[i].filterName])
                      : (titleList[i].filterName == "transactionPrice"
                          ? currencyFormat.currencySymbol +
                              " " +
                              currencyFormat.format(double.parse(searchResultList![index].toJson()[titleList[i].filterName]) / 10000000)
                          : searchResultList![index].toJson()[titleList[i].filterName].toString()))
                  : "",
              titleList[i].cellWidth.w,
              false,
              index: index)),
    );
  }
}
