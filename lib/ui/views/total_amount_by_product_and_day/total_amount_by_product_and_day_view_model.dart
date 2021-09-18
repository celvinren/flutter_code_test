import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';
import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/app/services/file_reader_service.dart';
import 'package:dev_coding_test_calvin/helpers/calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TotalAmountByProductAndDayViewModel extends CustomBaseViewModel {
  static final FileReaderService _fileReaderService = locator<FileReaderService>();
  ValueNotifier<List<Transaction>> _transactionList = _fileReaderService.getTransactionList as ValueNotifier<List<Transaction>>;
  ValueListenable<List<Transaction>> get getTransactionList => _transactionList;

  ValueNotifier<Map> _totalResultMap = ValueNotifier({});
  ValueListenable<Map> get getTotalResultMap => _totalResultMap;

  Future<void> init() async {
    groupTotalTransaction();
  }

  groupTotalTransaction() {
    _totalResultMap.value = groupTotalTransactionGroupByProductAndDay(_transactionList.value, Transaction.productGroupCodeStr);
  }
}
