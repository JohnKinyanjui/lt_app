import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/pages/property/tabs/property_listing.dart';
import 'package:lt_app/ui/pages/property/tenant_list.dart';

class PropertyPage extends ConsumerWidget {
  final String title;

  PropertyPage(this.title);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.white,
          title: Text(title,
              style: GoogleFonts.slabo27px(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          bottom: TabBar(
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [_tabview("Tenants"), _tabview("Listing")]),
        ),
        body: TabBarView(
          children: [TenantList(), PropertyListing()],
        ),
      ),
    );
  }
}

Widget _tabview(String text) {
  return Container(
    height: 50,
    width: 80,
    child: Center(
        child: Text(
      text,
      style: GoogleFonts.slabo27px(color: Colors.black, fontSize: 16),
    )),
  );
}
