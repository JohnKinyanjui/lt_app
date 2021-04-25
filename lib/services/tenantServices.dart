import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/services/propertyServices.dart';

// ignore: top_level_function_literal_block
final tenantStates = FutureProvider((ref) {
  var id = ref.watch(propertyId).state;
  return getTenants(id);
});

/*
@gets tenants that are a cretain property
*/
class TenantUnit {
  final String tenant__image;
  final String tenant__fullName;
  final String tenant__phoneNumber;
  final String propertyId;
  final String unitCode;
  final int balance;
  final int datePayment;
  final String paymentDate;
  final String paymentStatus;

  TenantUnit(
      {@required this.tenant__image,
      @required this.tenant__fullName,
      @required this.tenant__phoneNumber,
      @required this.propertyId,
      @required this.unitCode,
      @required this.balance,
      @required this.datePayment,
      @required this.paymentDate,
      @required this.paymentStatus});

  factory TenantUnit.fromJson(Map<String, dynamic> data) {
    return TenantUnit(
        tenant__image: data['tenant__image'],
        tenant__fullName: data['tenant__fullName'],
        tenant__phoneNumber: data['tenant__phoneNumber'],
        propertyId: data['propertyId'],
        unitCode: data['unitCode'],
        balance: data['balance'],
        datePayment: data['datePayment'],
        paymentDate: data['paymentDate'],
        paymentStatus: data['paymentStatus']);
  }
}

Future<List<TenantUnit>> getTenants(propertyId) async {
  var client = http.Client();
  try {
    var url = Uri.parse("$Url/tenant/tenantUnitView?propertyId=$propertyId");
    var response = await client.get(url);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return (data as List).map((e) => TenantUnit.fromJson(e)).toList();
    } else {
      final List<TenantUnit> a = [];
      return a;
    }
  } finally {
    client.close();
  }
}
