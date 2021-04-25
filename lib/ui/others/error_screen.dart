import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/widgets/lt_button.dart';

class ErrorScreen extends ConsumerWidget {
  final FutureProvider provider;
  final String error;

  const ErrorScreen({Key key, this.provider, this.error}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error.toString(), style: GoogleFonts.slabo27px()),
          LtButton(
            text: "Refresh",
            onpress: () => context.refresh(provider),
          )
        ],
      ),
    );
  }
}
