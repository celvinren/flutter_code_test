import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/ui/views/search_by_client_number/search_by_client_number_view_model.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalTable extends StatelessWidget {
  final List<Transaction> searchResultList;
  final HDTRefreshController hdtRefreshController;
  HorizontalTable(this.searchResultList, this.hdtRefreshController);

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 50.w,
      rightHandSideColumnWidth: 600.w,
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
    return [
      _getTitleItemWidget('index', 50.w),
      _getTitleItemWidget('Client Number', 150.w),
      _getTitleItemWidget('Product Group', 150.w),
      _getTitleItemWidget('Transaction Date', 150.w),
      _getTitleItemWidget('Transaction Price', 350.w),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      width: width,
      height: 56.h,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(index.toString()),
      width: 50.w,
      height: 52.h,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      color: index % 2 == 0 ? Colors.grey : Colors.white,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(searchResultList[index].clientNumber ?? ""),
          width: 150.w,
          height: 52.h,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: index % 2 == 0 ? Colors.grey : Colors.white,
        ),
        Container(
          child: Text(searchResultList[index].productGroupCode ?? ""),
          width: 150.w,
          height: 52.h,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: index % 2 == 0 ? Colors.grey : Colors.white,
        ),
        Container(
          child: Text(DateFormat("yyyy-MM-d").format(searchResultList[index].transactionDate!)),
          width: 150.w,
          height: 52.h,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: index % 2 == 0 ? Colors.grey : Colors.white,
        ),
        Container(
          child: Text(searchResultList[index].transactionPrice!),
          width: 150.w,
          height: 52.h,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          color: index % 2 == 0 ? Colors.grey : Colors.white,
        ),
      ],
    );
  }
}
