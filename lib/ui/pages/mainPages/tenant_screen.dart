import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/list/property_list.dart';
import 'package:lt_app/ui/widgets/dashboard/dashboard.dart';

class TenantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dashboard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "My Properties",
                  style: GoogleFonts.slabo27px(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PropertyList()
            ],
          ),
        ),
      ),
    );
  }
}
