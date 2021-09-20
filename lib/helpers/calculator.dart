import 'dart:collection';

import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:collection/collection.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';

groupTotalTransactionGroupByProductAndDay(List<Transaction> transactionList, String filter) {
  ///The final map should be
  ///{
  ///   2010-08-10:{
  ///     FG:20154896,
  ///     TR:8954125
  ///   }
  ///}
  ///
  //group by datetime, datetime as the key of the map
  Map<DateTime, List<Transaction>> groupByTransationDate = groupBy(transactionList, (obj) => obj.transactionDate!);

  //group by products group code, exchange code, symbol
  Map groupByTransationDateAndProduct = {};
  groupByTransationDate.keys.forEach((element) {
    Map map = {};
    map[element] = groupBy(
        groupByTransationDate[element] as List<Transaction>,
        (obj) =>
            ((obj as Transaction).productGroupCode ?? "Null") +
            "+" +
            (obj.exchangeCode ?? "Null") +
            "+" +
            (obj.symbol ?? "Null") +
            "+" +
            (obj.buySellCode ?? "Null"));
    //sort map by product
    var sortedKeys = map[element].keys.toList(growable: false)..sort((k1, k2) => (k2 as String).compareTo(k1 as String));
    groupByTransationDateAndProduct[element] = LinkedHashMap.fromIterable(sortedKeys, key: (k) => k, value: (k) => map[element][k]);
  });

  //calculate the sum number for the product
  var totalsGroupByTransationDateAndProduct = {};
  groupByTransationDateAndProduct.keys.forEach((e) {
    totalsGroupByTransationDateAndProduct[e] = {};
    (groupByTransationDateAndProduct[e] as Map).keys.forEach((k) {
      num total = (groupByTransationDateAndProduct[e]![k] as List<Transaction>)
          .fold(0, (previousValue, element) => previousValue + double.parse(element.transactionPrice!) / 10000000);
      totalsGroupByTransationDateAndProduct[e][k] = total;
    });
  });

  //sort map by dateTime key
  var sortedKeys = totalsGroupByTransationDateAndProduct.keys.toList(growable: false)..sort((k1, k2) => k2.compareTo(k1));
  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys, key: (k) => k, value: (k) => totalsGroupByTransationDateAndProduct[k]);

  return sortedMap;
}

Map<String, Transaction> groupTotalTransactionGroupByClientsAndProductAndDay(List<Transaction> transactionList, String filter) {
  ///The final map should be
  ///{
  ///   2010-08-10:{
  ///     FG:20154896,
  ///     TR:8954125
  ///   }
  ///}
  ///
  //group by datetime, datetime as the key of the map
  Map<String, List<Transaction>> groupByTransationDate = groupBy(
      transactionList,
      (obj) =>
          datetimeFormat.format(obj.transactionDate!) +
          "+" +
          obj.clientNumber! +
          "+" +
          obj.productGroupCode! +
          "+" +
          obj.exchangeCode! +
          "+" +
          obj.symbol! +
          "+" +
          obj.buySellCode!);

  Map<String, Transaction> totalGroupByTransactionDate = {};
  groupByTransationDate.forEach((key, value) {
    // num total = value.fold(
    //     0,
    //     (previousValue, element) =>
    //         previousValue +
    //         (double.parse(element.transactionPrice!) *
    //             (double.parse(element.quantityLong!) - double.parse(element.quantityShort!)) /
    //             10000000));
    num total = value.fold(0, (previousValue, element) => previousValue + (double.parse(element.transactionPrice!) / 10000000));
    num totalQuantityLong = value.fold(0, (previousValue, element) => previousValue + double.parse(element.quantityLong!));
    num totalQuantityShort = value.fold(0, (previousValue, element) => previousValue + double.parse(element.quantityShort!));
    totalGroupByTransactionDate[key] = Transaction()
      ..clientType = value[0].clientType
      ..clientNumber = value[0].clientNumber
      ..accountNumber = value[0].accountNumber
      ..subAccountNumber = value[0].subAccountNumber
      ..buySellCode = value[0].buySellCode
      ..quantityLong = totalQuantityLong.toString()
      ..quantityShort = totalQuantityShort.toString()
      ..productGroupCode = value[0].productGroupCode
      ..exchangeCode = value[0].exchangeCode
      ..symbol = value[0].symbol
      ..expirationDate = value[0].expirationDate
      ..transactionDate = value[0].transactionDate
      ..transactionPrice = total.toString();
  });
  // //sort map by dateTime key
  var sortedKeys = totalGroupByTransactionDate.keys.toList(growable: false)..sort((k1, k2) => k2.compareTo(k1));
  Map<String, Transaction> sortedMap =
      Map<String, Transaction>.fromIterable(sortedKeys, key: (k) => k, value: (k) => totalGroupByTransactionDate[k]!);

  return sortedMap;
}
