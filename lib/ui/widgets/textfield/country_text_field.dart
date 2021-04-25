import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CountryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String i) onChanged;

  const CountryTextField({
    Key key,
    this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntlPhoneField(
            initialCountryCode: 'KE',
            style: GoogleFonts.slabo27px(fontSize: 14),
            keyboardType: TextInputType.phone,
            showDropdownIcon: false,
            controller: controller,
            onCountryChanged: (i) {
              onChanged((i.countryCode.toString()));
            },
            decoration: InputDecoration(
                hintText: label,
                alignLabelWithHint: false,
                counterText: "",
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
