import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LtCorouselItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const LtCorouselItem({Key key, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 40,
            ),
            SizedBox(
              height: 20,
            ),
            Text(title,
                style: GoogleFonts.slabo27px(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
