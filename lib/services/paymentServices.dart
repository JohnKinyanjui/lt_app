import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lt_app/configs/apiConfig.dart';

/*
@payment transactions 
*/
final tenantId = StateProvider((ref) => 'all');
// ignore: top_level_function_literal_block
final transactionsState = FutureProvider((ref) {
  var id = ref.watch(tenantId).state;
  return getPropertyTransactions(id);
});

/*
@payment transactions
This are transactions are created when a tenant pays a unit
*/
class PaymentTransaction {
  final String tenant__phoneNumber;
  final String transactionId;
  final String amount;
  final String propertyId;
  final String unitCode;
  final String date;

  PaymentTransaction(
      {this.tenant__phoneNumber,
      this.transactionId,
      this.amount,
      this.propertyId,
      this.unitCode,
      this.date});

  factory PaymentTransaction.fromJson(Map<String, dynamic> data) {
    return PaymentTransaction(
        tenant__phoneNumber: data['tenant__phoneNumber'],
        transactionId: data['transactionId'],
        amount: data['amount'],
        propertyId: data['propertyId'],
        unitCode: data['unitCode'],
        date: data['date']);
  }
}

Future<List<PaymentTransaction>> getPropertyTransactions(propertyId) async {
  var client = http.Client();
  try {
    var url = Uri.parse("$Url/payments/paymentView?category=$propertyId");
    var response = await client.get(url);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return (data as List).map((e) => PaymentTransaction.fromJson(e)).toList();
    } else {
      final List<PaymentTransaction> a = [];
      return a;
    }
  } finally {
    client.close();
  }
}
