import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/configs/apiConfig.dart';
import 'package:lt_app/services/propertyServices.dart';
import 'package:lt_app/ui/list/property_list.dart';
import 'package:lt_app/ui/others/error_screen.dart';
import 'package:lt_app/ui/pages/property/property_page.dart';

class PropertiesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final p = watch(propertyStates);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "My Properties",
                    style: GoogleFonts.slabo27px(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              p.when(
                  data: (i) => ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: i.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300], blurRadius: 2)
                                ]),
                            child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => EdgeInsets.zero),
                              ),
                              onPressed: () {
                                context.read(propertyId).state =
                                    i[index].propertyId;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PropertyPage(i[index].name)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "$Url/media/${i[index].image}"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(i[index].name,
                                            style: GoogleFonts.slabo27px(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            i[index].units.toString() +
                                                " Units",
                                            style: GoogleFonts.slabo27px(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, v) => ErrorScreen(
                        error: e.toString(),
                        provider: propertyStates,
                      ))
            ],
          ),
        ));
  }
}
