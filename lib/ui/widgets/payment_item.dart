import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(color: Colors.grey[300], width: 0.5)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(height: 10),
            Text("Mr Jakes", style: GoogleFonts.poppins()),
            SizedBox(height: 5),
            Text("12 March 2021",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey)),
            SizedBox(height: 5),
            Text("KSH 500",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.green)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
