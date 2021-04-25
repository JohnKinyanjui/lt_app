import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LtAppBar extends StatelessWidget {
  final Function onpress;
  final String title;
  final String subtitle;

  const LtAppBar({Key key, this.onpress, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        IconButton(
            icon: Icon(Icons.close, color: Colors.white), onPressed: onpress),
        ListTile(
          title: Text(title,
              style: GoogleFonts.slabo27px(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle,
              style: GoogleFonts.slabo27px(
                color: Colors.white,
                fontSize: 15,
              )),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
