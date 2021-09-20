import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
class FileReaderService {
  ValueNotifier<List<Transaction>> _transactionList = ValueNotifier([]);
  ValueListenable<List<Transaction>> get getTransactionList => _transactionList;

  Future<FileReaderService> init() async {
    FileReaderService fileReaderService = FileReaderService();
    var s = await rootBundle.loadString('assets/Input.txt');
    var sList = s.split("\n");
    sList.forEach((e) {
      fileReaderService._transactionList.value.add(Transaction.fromString(e));
    });
    return fileReaderService;
  }
}
