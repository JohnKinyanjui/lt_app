import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LtButton extends StatelessWidget {
  final String text;
  final Function onpress;

  const LtButton({Key key, this.text, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: double.infinity,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black)),
                onPressed: onpress,
                child: Text(text,
                    style: GoogleFonts.slabo27px(
                      color: Colors.white,
                    )))),
      ),
    );
  }
}
