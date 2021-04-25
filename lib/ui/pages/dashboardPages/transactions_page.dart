import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lt_app/services/paymentServices.dart';
import 'package:lt_app/ui/others/error_screen.dart';
import 'package:lt_app/ui/widgets/textfield/search_text_field.dart';
import 'package:lt_app/ui/widgets/transaction_item.dart';

class TransactionsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final t = watch(transactionsState);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SearchTextField(
            label: "Search e.g 25461234567",
            onComplete: (i) {},
          ),
          Expanded(
            child: t.when(
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
          )
        ],
      )),
    );
  }
}
