import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/configs/settingsConfig.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

final merchantState = FutureProvider((ref) => getMerchant());

/*
@Authorises Merchant
Merchant has add phone Number and password
**/
// ignore: non_constant_identifier_names
Future<String> AuthMerchant(phoneNumber, password) async {
  var client = http.Client();
  try {
    var url = Uri.parse("$Url/auth/authView");
    var response = await client
        .post(url, body: {"phoneNumber": phoneNumber, "password": password});
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      if (data.containsKey('token')) {
        final preferences = await StreamingSharedPreferences.instance;
        final settings = MyAppSettings(preferences);
        settings.token.setValue(data['token']);
        String token = data['token'];
        return token;
      } else {
        return "None";
      }
    } else if (response.statusCode != 200) {
      return "None";
    }
  } finally {
    client.close();
  }
}

/*
@Merchant View
Returns the Merchants profile Info
*/
class Merchant {
  final String image;
  final String fullName;
  final String indentificationNumber;
  final String phoneNumber;
  final String email;

  Merchant(
      {this.image,
      this.fullName,
      this.indentificationNumber,
      this.phoneNumber,
      this.email});

  factory Merchant.fromModel(Map<String, dynamic> data) {
    return Merchant(
        image: data['image'],
        fullName: data['fullName'],
        indentificationNumber: data['indentificationNumber'],
        phoneNumber: data['phoneNumber'],
        email: data['email']);
  }
}

Future<Merchant> getMerchant() async {
  var client = http.Client();
  try {
    final preferences = await StreamingSharedPreferences.instance;
    final settings = MyAppSettings(preferences);
    var url =
        Uri.parse("$Url/auth/authView?token=${settings.token.getValue()}");
    var response = await client.get(url);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Merchant.fromModel(data);
    }
  } finally {
    client.close();
  }
}
