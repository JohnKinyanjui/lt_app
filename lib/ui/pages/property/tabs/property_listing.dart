import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/services/propertyServices.dart';
import 'package:lt_app/ui/others/error_screen.dart';
import 'package:lt_app/ui/pages/property/property_page.dart';

class PropertyListing extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final p = watch(propertyListingStates);
    return p.when(
        data: (i) => ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: i.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(i[index].name,
                        style: GoogleFonts.slabo27px(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(i[index].description,
                            style: GoogleFonts.slabo27px(
                                fontSize: 15, color: Colors.grey)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text("KSH " + i[index].cost,
                                style: GoogleFonts.slabo27px(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 2,
                              ),
                            ),
                            Text(i[index].units.toString() + " Units",
                                style: GoogleFonts.slabo27px(
                                    fontSize: 13,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider()
                ],
              );
            }),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, v) => ErrorScreen(
              error: e,
              provider: propertyStates,
            ));
  }
}
