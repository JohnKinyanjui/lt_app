import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String i) onComplete;

  const SearchTextField({Key key, this.label, this.controller, this.onComplete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                onSubmitted: (i) {
                  onComplete(i);
                },
                controller: controller,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration:
                    InputDecoration(hintText: label, border: InputBorder.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
