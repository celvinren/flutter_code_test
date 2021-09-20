import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/material.dart';

class HorizontalTableWithGroup extends HorizontalTable {
  final List<Widget> rowList;
  HorizontalTableWithGroup({
    required this.rowList,
    required int itemCount,
    required double tableHeight,
    required List<CellInfo> titleList,
  }) : super(itemCount: itemCount, titleList: titleList, tableHeight: tableHeight, isShowHeader: false, isShowIndexColumn: false);

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    return rowList[index];
  }
}
