import 'package:dev_coding_test_calvin/app/core/custom_base_view_model.dart';
import 'package:dev_coding_test_calvin/app/locator/locator.dart';
import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/app/services/file_reader_service.dart';
import 'package:dev_coding_test_calvin/helpers/validator.dart';
import 'package:dev_coding_test_calvin/ui/widgets/horizontal_table.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class SearchByClientNumberViewModel extends CustomBaseViewModel {
  static final FileReaderService _fileReaderService = locator<FileReaderService>();
  ValueNotifier<List<Transaction>> _transactionList = _fileReaderService.getTransactionList as ValueNotifier<List<Transaction>>;
  ValueListenable<List<Transaction>> get getTransactionList => _transactionList;

  ValueNotifier<List<Transaction>> _searchResultList = ValueNotifier([]);
  ValueListenable<List<Transaction>> get getSearchResultList => _searchResultList;

  TextEditingController textFieldController = TextEditingController();
  final GlobalKey<FormState> clientNumberFormKey = GlobalKey<FormState>();

  HDTRefreshController hdtRefreshController = HDTRefreshController();
  Future<void> init() async {
    _searchResultList.value = List.from(_transactionList.value);
  }

  List<CellInfo> titleList = [
    CellInfo("Client Number", 150, filterName: Transaction.clientNumberStr),
    CellInfo("Product Group", 150, filterName: Transaction.productGroupCodeStr),
    CellInfo("Transaction Date", 150, filterName: Transaction.transactionDateStr),
    CellInfo("Transaction Price", 140, filterName: Transaction.transactionPriceStr),
  ];
  searchClientNumber(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (clientNumberFormKey.currentState!.validate()) {
      if (textFieldController.text.length != 0) {
        _searchResultList.value = _transactionList.value.where((e) => e.clientNumber == textFieldController.text).toList();
      } else {
        _searchResultList.value = List.from(_transactionList.value);
      }
    }
  }

  String? validatorClientNumber(String? value) {
    if (value?.length == 0) {
      return null;
    }
    if (value?.length != 4) {
      return "Client Number should 4 digital number";
    }
    if (!isNumeric(value)) {
      return "Client Number form is wrong, please put in correct client number";
    }
    return null;
  }

  cleanAction(BuildContext context) {
    textFieldController.clear();
    FocusScope.of(context).unfocus();
    _searchResultList.value = List.from(_transactionList.value);
  }
}
