class Transaction {
  int? recordCode;
  String? clientType;
  String? clientNumber;
  String? accountNumber;
  String? subAccountNumber;
  String? oppositePartyCode;
  String? productGroupCode;
  String? exchangeCode;
  String? symbol;
  DateTime? expirationDate;
  String? currencyCode;
  String? movementCode;
  String? buySellCode;
  String? quantityLongSign;
  String? quantityLong;
  String? quantityShortSign;
  String? quantityShort;
  String? exchBrokerFee;
  String? exchBrokerFeeeDC;
  String? exchBrokerFeeCurCode;
  String? clearingFee;
  String? clearingFeeDC;
  String? clearingFeeCurCode;
  String? commission;
  String? commistionDC;
  String? commissionCurCode;
  DateTime? transactionDate;
  String? futureReference;
  String? ticketNumber;
  String? externalNumber;
  String? transactionPrice;
  String? traderInitials;
  String? oppositeTraderID;
  String? openCloseCode;

  Transaction(
      {this.recordCode,
      this.clientType,
      this.clientNumber,
      this.accountNumber,
      this.subAccountNumber,
      this.oppositePartyCode,
      this.productGroupCode,
      this.exchangeCode,
      this.symbol,
      this.expirationDate,
      this.currencyCode,
      this.movementCode,
      this.buySellCode,
      this.quantityLongSign,
      this.quantityLong,
      this.quantityShortSign,
      this.quantityShort,
      this.exchBrokerFee,
      this.exchBrokerFeeeDC,
      this.exchBrokerFeeCurCode,
      this.clearingFee,
      this.clearingFeeDC,
      this.clearingFeeCurCode,
      this.commission,
      this.commistionDC,
      this.commissionCurCode,
      this.transactionDate,
      this.futureReference,
      this.ticketNumber,
      this.externalNumber,
      this.transactionPrice,
      this.traderInitials,
      this.oppositeTraderID,
      this.openCloseCode});

  static String clientTypeStr = "clientType";
  static String clientNumberStr = "clientNumber";
  static String accountNumberStr = "accountNumber";
  static String subAccountNumberStr = "subAccountNumber";
  static String exchangeCodeStr = "exchangeCode";
  static String productGroupCodeStr = "productGroupCode";
  static String symbolStr = "symbol";
  static String expirationDateStr = "expirationDate";
  static String buySellCodeStr = "buySellCode";
  static String quantityLongStr = "quantityLong";
  static String quantityShortStr = "quantityShort";
  static String transactionDateStr = "transactionDate";
  static String transactionPriceStr = "transactionPrice";

  Transaction.fromString(String record) {
    recordCode = int.parse(record.substring(0, 3));
    clientType = record.substring(3, 7) == "    " ? null : record.substring(3, 7);
    clientNumber = record.substring(7, 11);
    accountNumber = record.substring(11, 15);
    subAccountNumber = record.substring(15, 19);
    oppositePartyCode = record.substring(19, 25);
    productGroupCode = record.substring(25, 27);
    exchangeCode = record.substring(27, 31);
    symbol = record.substring(31, 37);
    expirationDate = DateTime.parse(record.substring(37, 45));
    currencyCode = record.substring(45, 48);
    movementCode = record.substring(48, 50);
    buySellCode = record.substring(50, 51);
    quantityLongSign = record.substring(51, 52);
    quantityLong = record.substring(52, 62);
    quantityShortSign = record.substring(62, 63);
    quantityShort = record.substring(63, 73);
    exchBrokerFee = record.substring(73, 85);
    exchBrokerFeeeDC = record.substring(85, 86);
    exchBrokerFeeCurCode = record.substring(86, 89);
    clearingFee = record.substring(89, 101);
    clearingFeeDC = record.substring(101, 102);
    clearingFeeCurCode = record.substring(102, 105);
    commission = record.substring(105, 117);
    commistionDC = record.substring(117, 118);
    commissionCurCode = record.substring(118, 121);
    transactionDate = DateTime.parse(record.substring(121, 129));
    futureReference = record.substring(129, 135);
    ticketNumber = record.substring(135, 141);
    externalNumber = record.substring(141, 147);
    transactionPrice = record.substring(147, 162);
    traderInitials = record.substring(162, 168);
    oppositeTraderID = record.substring(168, 175);
    openCloseCode = record.substring(175, 175);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordCode'] = this.recordCode;
    data['clientType'] = this.clientType;
    data['clientNumber'] = this.clientNumber;
    data['accountNumber'] = this.accountNumber;
    data['subAccountNumber'] = this.subAccountNumber;
    data['oppositePartyCode'] = this.oppositePartyCode;
    data['productGroupCode'] = this.productGroupCode;
    data['exchangeCode'] = this.exchangeCode;
    data['symbol'] = this.symbol;
    data['expirationDate'] = this.expirationDate;
    data['currencyCode'] = this.currencyCode;
    data['movementCode'] = this.movementCode;
    data['buySellCode'] = this.buySellCode;
    data['quantityLongSign'] = this.quantityLongSign;
    data['quantityLong'] = this.quantityLong;
    data['quantityShortSign'] = this.quantityShortSign;
    data['quantityShort'] = this.quantityShort;
    data['exchBrokerFee'] = this.exchBrokerFee;
    data['exchBrokerFeeeDC'] = this.exchBrokerFeeeDC;
    data['exchBrokerFeeCurCode'] = this.exchBrokerFeeCurCode;
    data['clearingFee'] = this.clearingFee;
    data['clearingFeeDC'] = this.clearingFeeDC;
    data['clearingFeeCurCode'] = this.clearingFeeCurCode;
    data['commission'] = this.commission;
    data['commistionDC'] = this.commistionDC;
    data['commissionCurCode'] = this.commissionCurCode;
    data['transactionDate'] = this.transactionDate;
    data['futureReference'] = this.futureReference;
    data['ticketNumber'] = this.ticketNumber;
    data['externalNumber'] = this.externalNumber;
    data['transactionPrice'] = this.transactionPrice;
    data['traderInitials'] = this.traderInitials;
    data['oppositeTraderID'] = this.oppositeTraderID;
    data['openCloseCode'] = this.openCloseCode;
    return data;
  }
}
