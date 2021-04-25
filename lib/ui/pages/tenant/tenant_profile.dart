import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/configs/settingsConfig.dart';
import 'package:lt_app/services/tenantServices.dart';

class TenantProfile extends ConsumerWidget {
  final TenantUnit tenant;

  TenantProfile(this.tenant);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final titleStyle = GoogleFonts.slabo27px(color: Colors.grey, fontSize: 12);
    final subStyle = GoogleFonts.slabo27px(color: Colors.black, fontSize: 16);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop()),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('$Url/media/${tenant.tenant__image}'),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("Full Name", style: titleStyle),
              subtitle: Text(tenant.tenant__fullName, style: subStyle),
            ),
            ListTile(
              title: Text("Phone Number", style: titleStyle),
              subtitle: Text(tenant.tenant__phoneNumber, style: subStyle),
            ),
            ListTile(
              title: Text("Balance", style: titleStyle),
              subtitle:
                  Text("KSH " + tenant.balance.toString(), style: subStyle),
            ),
            ListTile(
              title: Text("Date of Payment", style: titleStyle),
              subtitle: Text(tenant.paymentDate.toString(), style: subStyle),
            ),
            ListTile(
              title: Text("Payment Status", style: titleStyle),
              subtitle: Text(tenant.paymentStatus, style: subStyle),
            ),
          ],
        ),
      ),
    );
  }
}
