import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/pages/mainPages/profile_screen.dart';
import 'package:lt_app/ui/pages/mainPages/tenant_screen.dart';
import 'package:lt_app/ui/pages/mainPages/transaction_screen.dart';

final pageNoState = StateProvider((ref) => 0);


class LtMainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final no = watch(pageNoState).state;
    final PageStorageBucket _bucket = PageStorageBucket();
    final List<Widget> pages = [
      TenantScreen(),
      TransactionScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: _bucket,
        child: pages[no],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: no,
        selectedLabelStyle: GoogleFonts.slabo27px(fontSize: 11),
        unselectedLabelStyle: GoogleFonts.slabo27px(fontSize: 11),
        onTap: (i) => context.read(pageNoState).state = i,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.group),
              icon: Icon(Icons.group_outlined),
              label: "Tenants"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_balance_wallet),
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: "Transaction"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: "Profile"),
        ],
      ),
    );
  }
}
