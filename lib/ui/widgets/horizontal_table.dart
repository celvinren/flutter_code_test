import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class HorizontalTable extends StatelessWidget {
  final List<Transaction>? searchResultList;
  final List<CellInfo> titleList;
  final int? itemCount;
  final double? tableHeight;
  final bool isShowHeader;
  final bool isShowIndexColumn;
  HorizontalTable(
      {this.searchResultList,
      this.itemCount,
      this.tableHeight,
      this.isShowHeader = true,
      this.isShowIndexColumn = true,
      required this.titleList});
  final HDTRefreshController hdtRefreshController = HDTRefreshController();
  final ScrollController verticalScrollController = ScrollController();
  final ScrollController horizontalScrollController = ScrollController();

  static double titleHeight = 56;
  static double cellHeight = 52;

  @override
  Widget build(BuildContext context) {
    double tableWidth = 0;
    titleList.forEach((e) {
      tableWidth = tableWidth + e.cellWidth;
    });
    double? tableHeight = this.tableHeight != null
        ? this.tableHeight
        : (titleHeight + cellHeight * (searchResultList != null ? searchResultList!.length : 0));
    return HorizontalDataTable(
      leftHandSideColumnWidth: isShowHeader ? 50.w : 0,
      rightHandSideColumnWidth: tableWidth.w,
      tableHeight: tableHeight,
      isFixedHeader: isShowHeader ? true : false,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: generateRightHandSideColumnRow,
      itemCount: itemCount != null ? itemCount! : (searchResultList != null ? searchResultList!.length : 0),
      rowSeparatorWidget: const Divider(
        color: Colors.black54,
        height: 1.0,
        thickness: 0.0,
      ),
      leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      verticalScrollbarStyle: const ScrollbarStyle(
        thumbColor: Colors.yellow,
        isAlwaysShown: true,
        thickness: 4.0,
        radius: Radius.circular(5.0),
      ),
      horizontalScrollbarStyle: const ScrollbarStyle(
        thumbColor: Colors.red,
        isAlwaysShown: true,
        thickness: 4.0,
        radius: Radius.circular(5.0),
      ),
      enablePullToRefresh: true,
      refreshIndicator: const WaterDropHeader(),
      refreshIndicatorHeight: 60,
      onRefresh: () async {
        //Do sth
        await Future.delayed(const Duration(milliseconds: 500));
        hdtRefreshController.refreshCompleted();
      },
      htdRefreshController: hdtRefreshController,
      verticalScrollController: verticalScrollController,
      horizontalScrollController: horizontalScrollController,
    );
  }

  List<Widget> _getTitleWidget() {
    return List.generate(titleList.length, (i) => HorizontalTable.getCellItemWidget(titleList[i].value, titleList[i].cellWidth.w, true))
      ..insert(0, HorizontalTable.getCellItemWidget("index", 50.w, true));
  }

  static Widget getCellItemWidget(String label, double width, bool isTitle, {int? index}) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: isTitle ? FontWeight.bold : FontWeight.normal)),
      width: width,
      height: isTitle ? titleHeight.h : cellHeight.h,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      color: isTitle ? Colors.white : (index != null ? (index % 2 == 0 ? Colors.grey : Colors.white) : Colors.white),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return HorizontalTable.getCellItemWidget((index + 1).toString(), 50.w, false, index: index);
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index);
}

class CellInfo {
  final String value;
  final String? filterName;
  final double cellWidth;
  CellInfo(
    this.value,
    this.cellWidth, {
    this.filterName,
  });
}
