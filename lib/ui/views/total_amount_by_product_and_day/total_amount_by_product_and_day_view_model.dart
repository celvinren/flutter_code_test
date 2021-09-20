import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';
import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/app/services/file_reader_service.dart';
import 'package:dev_coding_test_calvin/helpers/calculator.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalAmountByProductAndDayViewModel extends CustomBaseViewModel {
  static final FileReaderService _fileReaderService = locator<FileReaderService>();
  ValueNotifier<List<Transaction>> _transactionList = _fileReaderService.getTransactionList as ValueNotifier<List<Transaction>>;
  ValueListenable<List<Transaction>> get getTransactionList => _transactionList;

  Map _totalResultMap = {};

  ValueNotifier<Widget?> _table = ValueNotifier(null);
  ValueListenable<Widget?> get getTable => _table;

  List<CellInfo> titleList = [
    CellInfo("Produc Group Code", 150, filterName: Transaction.productGroupCodeStr),
    CellInfo("Exchange Code", 150, filterName: Transaction.exchangeCodeStr),
    CellInfo("Symbol", 100, filterName: Transaction.symbolStr),
    CellInfo("Buy or Sale", 100, filterName: Transaction.buySellCodeStr),
    CellInfo("Transaction Total Price", 170, filterName: Transaction.transactionPriceStr),
  ];

  Future<void> init() async {
    groupTotalTransaction();
    generateTable();
  }

  groupTotalTransaction() {
    _totalResultMap = groupTotalTransactionGroupByProductAndDay(_transactionList.value, Transaction.productGroupCodeStr);
  }

  generateTable() {
    int itemCount = 0;
    _totalResultMap.forEach((key, value) {
      itemCount = itemCount + (value as Map).length + 2;
    });

    List<Widget> rowList = [];
    _totalResultMap.forEach((key, value) {
      rowList.add(
        Container(
          height: HorizontalTable.cellHeight,
          color: Colors.grey,
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            children: [
              Text(
                datetimeFormat.format(key),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp),
              )
            ],
          ),
        ),
      );
      rowList.add(Row(
        children: List.generate(
            titleList.length,
            (i) => HorizontalTable.getCellItemWidget(
                  titleList[i].value.toString(),
                  titleList[i].cellWidth.w,
                  false,
                )),
      ));
      value.forEach((key, value) {
        List<String> keyList = (key as String).split("+");
        String buyOrSale = keyList[keyList.length - 1] == "B" ? "Buy" : "Sale";
        keyList.removeAt(keyList.length - 1);
        keyList.add(buyOrSale);
        keyList.add(currencyFormat.format(value));
        print(currencyFormat.format(value));
        rowList.add(
          Row(
            children: List.generate(
              titleList.length,
              (i) => HorizontalTable.getCellItemWidget(
                keyList[i].toString(),
                titleList[i].cellWidth.w,
                false,
              ),
            ),
          ),
        );
      });
    });
    _table.value = HorizontalTableWithGroup(
      rowList: rowList,
      titleList: titleList,
      itemCount: itemCount,
      tableHeight: HorizontalTable.cellHeight * itemCount,
    );
  }
}
