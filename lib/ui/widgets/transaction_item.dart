import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionItem extends StatelessWidget {
  final String tenantId;
  final String date;
  final String amount;

  const TransactionItem({Key key, this.tenantId, this.date, this.amount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text("$tenantId",
                    style: GoogleFonts.slabo27px(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ),
            ),
            Expanded(
              child: Center(
                child: Text("$date",
                    style: GoogleFonts.slabo27px(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ),
            ),
            Expanded(
              child: Center(
                child: Text("$amount",
                    style: GoogleFonts.slabo27px(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
