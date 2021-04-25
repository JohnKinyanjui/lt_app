import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onpress;

  const DashBoardItem({Key key, this.icon, this.label, this.onpress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300], blurRadius: 10)
                    ]),
                child: Icon(icon),
              ),
            ),
          ),
          Text("$label", style: GoogleFonts.slabo27px(fontSize: 11))
        ],
      ),
    );
  }
}
