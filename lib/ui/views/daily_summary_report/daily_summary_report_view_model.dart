import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';
import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/app/services/file_reader_service.dart';
import 'package:dev_coding_test_calvin/helpers/calculator.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DailySummaryReportViewModel extends CustomBaseViewModel {
  static final FileReaderService _fileReaderService = locator<FileReaderService>();
  ValueNotifier<List<Transaction>> _transactionList = _fileReaderService.getTransactionList as ValueNotifier<List<Transaction>>;
  ValueListenable<List<Transaction>> get getTransactionList => _transactionList;

  ValueNotifier<Map<String, Transaction>> _totalResultMap = ValueNotifier({});
  ValueListenable<Map<String, Transaction>> get getTotalResultMap => _totalResultMap;

  ValueNotifier<List<Transaction>> _displayResultList = ValueNotifier([]);
  ValueListenable<List<Transaction>> get getDisplayResultList => _displayResultList;

  List<String> datetimeList = [];

  ValueNotifier<String> _selectedDateTime = ValueNotifier("");
  ValueListenable<String> get getSelectedDateTime => _selectedDateTime;

  List<CellInfo> titleList = [
    CellInfo("Buy or Sale", 100, filterName: Transaction.buySellCodeStr),
    CellInfo("Client Type", 150, filterName: Transaction.clientTypeStr),
    CellInfo("Client Number", 150, filterName: Transaction.clientNumberStr),
    CellInfo("Account Number", 150, filterName: Transaction.accountNumberStr),
    CellInfo("Sub Account Number", 170, filterName: Transaction.subAccountNumberStr),
    CellInfo("Produc Group Code", 150, filterName: Transaction.productGroupCodeStr),
    CellInfo("Exchange Code", 150, filterName: Transaction.exchangeCodeStr),
    CellInfo("Symbol", 100, filterName: Transaction.symbolStr),
    CellInfo("Expired Date", 150, filterName: Transaction.expirationDateStr),
    CellInfo("Transaction Date", 150, filterName: Transaction.transactionDateStr),
    CellInfo("Total Unit", 100, filterName: Transaction.quantityLongStr),
    CellInfo("Transaction Total Price", 190, filterName: Transaction.transactionPriceStr),
  ];

  Future<void> init() async {
    groupTotalTransaction();
    _totalResultMap.value.forEach((key, value) {
      var datetime = key.split("+")[0];
      if (!datetimeList.contains(datetime)) {
        datetimeList.add(datetime);
      }
    });
    _selectedDateTime.value = datetimeList[0];
    setDisplayResultList(_selectedDateTime.value);
  }

  groupTotalTransaction() {
    _totalResultMap.value = groupTotalTransactionGroupByClientsAndProductAndDay(_transactionList.value, Transaction.productGroupCodeStr);
  }

  setSelectedDateTime(String selectedDateTime) {
    _selectedDateTime.value = selectedDateTime;
    setDisplayResultList(selectedDateTime);
  }

  setDisplayResultList(String selectedDateTime) {
    List<Transaction> resultList = [];
    List<String> keyList = _totalResultMap.value.keys.where((e) => e.contains(_selectedDateTime.value)).toList();

    keyList.forEach((key) {
      Transaction value = _totalResultMap.value[key]!;
      resultList.add(Transaction()
        ..buySellCode = value.buySellCode == "B" ? "Buy" : "Sale"
        ..clientType = value.clientType
        ..clientNumber = value.clientNumber
        ..accountNumber = value.accountNumber
        ..subAccountNumber = value.subAccountNumber
        ..productGroupCode = value.productGroupCode
        ..exchangeCode = value.exchangeCode
        ..symbol = value.symbol
        ..expirationDate = value.expirationDate
        ..transactionDate = value.transactionDate
        ..quantityLong = (double.parse(value.quantityLong!) - double.parse(value.quantityShort!)).toString()
        ..transactionPrice = (double.parse(value.transactionPrice!) * 10000000).toString());
    });
    _displayResultList.value = resultList;
  }
}
