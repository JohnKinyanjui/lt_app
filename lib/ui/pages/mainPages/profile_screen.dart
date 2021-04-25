import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/services/authService.dart';

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final p = watch(merchantState);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text("Profile",
              style: GoogleFonts.slabo27px(
                  color: Colors.black, fontWeight: FontWeight.w600)),
        ),
        body: p.when(
            data: (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage("$Url/media/${e.image}"),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(e.fullName, style: GoogleFonts.slabo27px()),
                      subtitle:
                          Text(e.phoneNumber, style: GoogleFonts.slabo27px()),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Indentification Number",
                          style: GoogleFonts.slabo27px()),
                      subtitle: Text(e.indentificationNumber,
                          style: GoogleFonts.slabo27px()),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Email", style: GoogleFonts.slabo27px()),
                      subtitle: Text(e.email, style: GoogleFonts.slabo27px()),
                    ),
                    Divider(),
                  ],
                ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, v) => Center(child: Text("Error"))));
  }
}
