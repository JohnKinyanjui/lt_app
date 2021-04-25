import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LtFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const LtFormField({Key key, this.label, this.obscureText, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: controller,
                style: GoogleFonts.slabo27px(fontSize: 14),
                decoration:
                    InputDecoration(hintText: label, border: InputBorder.none),
                obscureText: obscureText == null ? false : true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
