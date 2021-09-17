import 'dart:collection';

import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:collection/collection.dart';

groupTotalTransactionGroupByProductAndDay(List<Transaction> transactionList) {
  var groupByTransationDate = groupBy(transactionList, (obj) => (obj as Transaction).transactionDate);

  var groupByTransationDateAndProduct = {};
  groupByTransationDate.keys.forEach((element) {
    groupByTransationDateAndProduct[element!] =
        groupBy(groupByTransationDate[element] as List<Transaction>, (obj) => (obj as Transaction).productGroupCode);
  });

  var totalsGroupByTransationDateAndProduct = {};
  groupByTransationDateAndProduct.keys.forEach((e) {
    totalsGroupByTransationDateAndProduct[e] = {};
    (groupByTransationDateAndProduct[e] as Map).keys.forEach((k) {
      num total = (groupByTransationDateAndProduct[e][k] as List<Transaction>)
          .fold(0, (previousValue, element) => previousValue + double.parse(element.transactionPrice!) / 10000000);
      totalsGroupByTransationDateAndProduct[e][k] = total;
    });
  });

  //sort map by dateTime key
  var sortedKeys = totalsGroupByTransationDateAndProduct.keys.toList(growable: false)..sort((k1, k2) => k2.compareTo(k1));
  LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys, key: (k) => k, value: (k) => totalsGroupByTransationDateAndProduct[k]);

  return sortedMap;
}
