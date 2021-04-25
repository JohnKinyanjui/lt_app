import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

final primaryColor = Colors.green;

class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences)
      : token = preferences.getString('token', defaultValue: "None");

  final Preference<String> token;
}
