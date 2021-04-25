import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/configs/settingsConfig.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

/*
@Property State MAnagement
*/
final propertyId = StateProvider((ref) => "");
final propertyUnitCode = StateProvider((ref) => "");
final propertyStates = FutureProvider((ref) => getProperties());
final propertyPaymentDate = StateProvider((ref) => "2021-09-12");

// ignore: top_level_function_literal_block
final propertyListingStates = FutureProvider((ref) {
  var id = ref.watch(propertyId).state;
  return getPropertyListing(id);
});

/*
@get merchant properties
Returns properties owned by the merchant
*/

class Property {
  final String propertyId;
  final String image;
  final String name;
  final int units;

  Property({this.propertyId, this.image, this.name, this.units});

  factory Property.fromJson(Map<String, dynamic> data) {
    return Property(
        propertyId: data['propertyId'],
        image: data['image'],
        name: data['name'],
        units: data['units']);
  }
}

Future<List<Property>> getProperties() async {
  var client = http.Client();
  try {
    final preferences = await StreamingSharedPreferences.instance;
    final settings = MyAppSettings(preferences);
    var url = Uri.parse(
        "$Url/property/propertyView?token=${settings.token.getValue()}");
    var response = await client.get(url);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return (data as List).map((e) => Property.fromJson(e)).toList();
    } else {
      final List<Property> a = [];
      return a;
    }
  } finally {
    client.close();
  }
}

/*
@get PropertyListing
get property Listing which is are associated with a specific property
*/
class PropertyListing {
  final String name;
  final String description;
  final String cost;
  final int units;

  PropertyListing({this.name, this.description, this.cost, this.units});

  factory PropertyListing.fromJson(Map<String, dynamic> data) {
    return PropertyListing(
        name: data["name"],
        description: data["description"],
        cost: data["cost"],
        units: data["units"]);
  }
}

Future<List<PropertyListing>> getPropertyListing(propertyId) async {
  var client = http.Client();
  try {
    var url =
        Uri.parse("$Url/property/propertyListView?propertyId=$propertyId");
    var response = await client.get(url);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return (data as List).map((e) => PropertyListing.fromJson(e)).toList();
    } else {
      final List<PropertyListing> a = [];
      return a;
    }
  } finally {
    client.close();
  }
}

/*
@Property Units
gets units which are rented by tenant for specific 
*/
