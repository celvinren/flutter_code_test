import 'dart:collection';

import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:collection/collection.dart';

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

  //group by products group code, product group code as the key
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
    //sort map by dateTime key
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
