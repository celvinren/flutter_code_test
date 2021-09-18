import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalTable extends StatelessWidget {
  final List<Transaction> searchResultList;
  final HDTRefreshController hdtRefreshController;
  final List<CellInfo> titleList;
  HorizontalTable(this.searchResultList, this.hdtRefreshController, this.titleList);

  @override
  Widget build(BuildContext context) {
    double tableWidth = 0;
    titleList.forEach((e) {
      tableWidth = tableWidth + e.cellWidth;
    });
    return HorizontalDataTable(
      leftHandSideColumnWidth: 50.w,
      rightHandSideColumnWidth: tableWidth.w,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: searchResultList.length,
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
    );
  }

  List<Widget> _getTitleWidget() {
    return List.generate(titleList.length, (i) => _getCellItemWidget(titleList[i].value, titleList[i].cellWidth.w, true))
      ..insert(0, _getCellItemWidget("index", 50.w, true));
  }

  Widget _getCellItemWidget(String label, double width, bool isTitle, {int? index}) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: isTitle ? FontWeight.bold : FontWeight.normal)),
      width: width,
      height: isTitle ? 56.h : 52.h,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      color: isTitle ? Colors.white : (index! % 2 == 0 ? Colors.grey : Colors.white),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return _getCellItemWidget((index + 1).toString(), 50.w, false, index: index);
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: List.generate(
          titleList.length,
          (i) => _getCellItemWidget(searchResultList[index].toJson()[titleList[i].filterName].toString(), titleList[i].cellWidth.w, false,
              index: index)),
    );
  }
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
