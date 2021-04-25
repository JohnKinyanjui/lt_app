import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/pages/dashboardPages/notification_page.dart';
import 'package:lt_app/ui/pages/dashboardPages/payments_page.dart';
import 'package:lt_app/ui/pages/dashboardPages/properties_page.dart';
import 'package:lt_app/ui/pages/dashboardPages/transactions_page.dart';
import 'package:lt_app/ui/pages/tenant/add_tenant.dart';
import 'package:lt_app/ui/widgets/dashboard/dashboard_item.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero)),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddTenant())),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Tenant",
                          style: GoogleFonts.slabo27px(color: Colors.grey)),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        child: TextButton(
                            onPressed: () {},
                            child: Icon(Icons.add, color: Colors.white)))
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            "Balance",
            style: GoogleFonts.slabo27px(color: Colors.grey, fontSize: 18),
          ),
          subtitle: Text("KSH 20000",
              style: GoogleFonts.slabo27px(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        ListTile(
          title: Text(
            "Today Earning",
            style: GoogleFonts.slabo27px(color: Colors.grey, fontSize: 12),
          ),
          subtitle: Text("+ 20000",
              style: GoogleFonts.slabo27px(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          width: double.infinity,
          child: GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            children: [
              DashBoardItem(
                icon: CupertinoIcons.money_dollar,
                label: "Payments",
                onpress: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentsPage())),
              ),
              DashBoardItem(
                icon: CupertinoIcons.bell,
                label: "Notifications",
                onpress: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage())),
              ),
              DashBoardItem(
                icon: CupertinoIcons.building_2_fill,
                label: "My Properties",
                onpress: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PropertiesPage())),
              ),
              DashBoardItem(
                icon: CupertinoIcons.money_dollar_circle,
                label: "Transactions",
                onpress: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TransactionsPage())),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
