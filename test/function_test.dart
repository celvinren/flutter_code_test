import 'package:dev_coding_test_calvin/app/models/transaction.dart';
import 'package:dev_coding_test_calvin/helpers/calculator.dart';
import 'package:dev_coding_test_calvin/helpers/formater.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test Calculation service - groupTransaction - Total group by Day and Product", () {
    DateTime date1 = DateTime.now().add(Duration(days: -1));
    DateTime date2 = DateTime.now();
    String productGroupCode1 = "GR";
    String productGroupCode2 = "RU";
    String exchangeCode1 = "NK  ";
    String exchangeCode2 = "NT  ";
    String symbol1 = "VC      ";
    String symbol2 = "GF      ";
    String buySellCode1 = "B";
    String buySellCode2 = "Y";
    List<Transaction> transactionList = [
      Transaction()
        ..productGroupCode = productGroupCode1
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..transactionDate = date1
        ..transactionPrice = "000012390000000",
      Transaction()
        ..productGroupCode = productGroupCode1
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..transactionDate = date1
        ..transactionPrice = "000022390000000",
      Transaction()
        ..productGroupCode = productGroupCode2
        ..exchangeCode = exchangeCode1
        ..symbol = symbol2
        ..buySellCode = buySellCode2
        ..transactionDate = date1
        ..transactionPrice = "000022590000000",
      Transaction()
        ..productGroupCode = productGroupCode2
        ..exchangeCode = exchangeCode2
        ..symbol = symbol2
        ..buySellCode = buySellCode2
        ..transactionDate = date1
        ..transactionPrice = "000029390000000",
      Transaction()
        ..productGroupCode = productGroupCode2
        ..exchangeCode = exchangeCode1
        ..symbol = symbol2
        ..buySellCode = buySellCode2
        ..transactionDate = date2
        ..transactionPrice = "000032390000000",
    ];

    Map totalMap = groupTotalTransactionGroupByProductAndDay(transactionList, 'exchangeCode');
    print(totalMap);
    expect(totalMap[date1][productGroupCode1 + "+" + exchangeCode1 + "+" + symbol1 + "+" + buySellCode1], 1239 + 2239);
    expect(totalMap[date1][productGroupCode2 + "+" + exchangeCode1 + "+" + symbol2 + "+" + buySellCode2], 2259);
    expect(totalMap[date2][productGroupCode2 + "+" + exchangeCode1 + "+" + symbol2 + "+" + buySellCode2], 3239);
  });

  test("Test Calculation service - groupTransaction - Total group by Day and Product", () {
    DateTime date1 = DateTime.now().add(Duration(days: -1));
    DateTime date2 = DateTime.now();
    String product1 = "GR";
    String product2 = "RU";
    String clientNumber1 = "9541";
    String clientNumber2 = "5647";
    String exchangeCode1 = "NK  ";
    String exchangeCode2 = "NT  ";
    String symbol1 = "VC      ";
    String symbol2 = "GF      ";
    int figure1 = 1239;
    int figure2 = 2239;
    int figure3 = 2259;
    int figure4 = 2939;
    int figure5 = 3239;
    String buySellCode1 = "B";
    String buySellCode2 = "Y";
    List<Transaction> transactionList = [
      Transaction()
        ..clientNumber = clientNumber2
        ..productGroupCode = product1
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..transactionDate = date1
        ..quantityLong = "0000000010"
        ..quantityShort = "0000000000"
        ..transactionPrice = "0000${figure1}0000000",
      Transaction()
        ..clientNumber = clientNumber2
        ..productGroupCode = product1
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..quantityLong = "0000000010"
        ..quantityShort = "0000000000"
        ..transactionDate = date1
        ..transactionPrice = "0000${figure2}0000000",
      Transaction()
        ..clientNumber = clientNumber1
        ..productGroupCode = product1
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..quantityLong = "0000000010"
        ..quantityShort = "0000000000"
        ..transactionDate = date1
        ..transactionPrice = "0000${figure3}0000000",
      Transaction()
        ..clientNumber = clientNumber1
        ..productGroupCode = product2
        ..exchangeCode = exchangeCode1
        ..symbol = symbol1
        ..buySellCode = buySellCode1
        ..quantityLong = "0000000010"
        ..quantityShort = "0000000000"
        ..transactionDate = date1
        ..transactionPrice = "0000${figure4}0000000",
      Transaction()
        ..clientNumber = clientNumber2
        ..productGroupCode = product2
        ..exchangeCode = exchangeCode2
        ..symbol = symbol2
        ..buySellCode = buySellCode2
        ..quantityLong = "0000000000"
        ..quantityShort = "0000000008"
        ..transactionDate = date2
        ..transactionPrice = "0000${figure5}0000000",
    ];

    Map totalMap = groupTotalTransactionGroupByClientsAndProductAndDay(transactionList, 'exchangeCode');
    print(totalMap);
    expect(
        double.parse((totalMap[datetimeFormat.format(date1) +
                "+" +
                clientNumber2 +
                "+" +
                product1 +
                "+" +
                exchangeCode1 +
                "+" +
                symbol1 +
                "+" +
                buySellCode1] as Transaction)
            .transactionPrice!),
        1239 + 2239);
    expect(
        double.parse((totalMap[datetimeFormat.format(date2) +
                "+" +
                clientNumber2 +
                "+" +
                product2 +
                "+" +
                exchangeCode2 +
                "+" +
                symbol2 +
                "+" +
                buySellCode2] as Transaction)
            .transactionPrice!),
        3239);
  });
}
