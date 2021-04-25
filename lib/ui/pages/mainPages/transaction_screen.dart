import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/services/paymentServices.dart';
import 'package:lt_app/ui/others/error_screen.dart';
import 'package:lt_app/ui/widgets/transaction_item.dart';

class TransactionScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final t = watch(transactionsState);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Transactions",
            style: GoogleFonts.slabo27px(
                color: Colors.black, fontWeight: FontWeight.w600)),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 30),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Center(
                      child: Text("User Id",
                          style: GoogleFonts.slabo27px(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Date",
                          style: GoogleFonts.slabo27px(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Amount (KSH)",
                            style: GoogleFonts.slabo27px(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      body: t.when(
          data: (i) => ListView.builder(
              itemCount: i.length,
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    tenantId: i[index].tenant__phoneNumber,
                    amount: i[index].amount,
                    date: i[index].date.substring(0, 10));
              }),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, v) => ErrorScreen(
                error: e.toString(),
                provider: transactionsState,
              )),
    );
  }
}
