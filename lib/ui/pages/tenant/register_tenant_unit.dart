import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/services/propertyServices.dart';
import 'package:lt_app/ui/widgets/lt_button.dart';
import 'package:lt_app/ui/widgets/tenantWidgets/tenant_property_choices.dart';
import 'package:lt_app/ui/widgets/tenantWidgets/tenant_unit_choices.dart';
import 'package:lt_app/ui/widgets/textfield/lt_form_field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterTenantUnit extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final date = watch(propertyPaymentDate).state;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Tenant Unit Registration',
                style: GoogleFonts.slabo27px(fontSize: 25),
              ),
              subtitle: Text(
                "Easily register tenant unit",
                style: GoogleFonts.slabo27px(),
              ),
            ),
            LtFormField(
              label: "Indentification Number",
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text(
                'Please choose the property',
                style: GoogleFonts.slabo27px(fontSize: 14, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TenantPropertyChoices(),
              ),
            ),
            ListTile(
                title: Text(
                  'Please choose the property unit',
                  style:
                      GoogleFonts.slabo27px(fontSize: 14, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: TenantUnitChoices(),
                )),
            ListTile(
                subtitle: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey[200])),
                  child: TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2021, 3, 5),
                            maxTime: DateTime(2090, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          context.read(propertyPaymentDate).state =
                              date.toString().substring(0, 10);
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'Choose Date of Payment',
                        style: GoogleFonts.slabo27px(color: Colors.black),
                      )),
                ),
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$date',
                      style: GoogleFonts.slabo27px(
                          color: Colors.black, fontSize: 18),
                    ),
                  ),
                )),
            LtButton(
              text: "Finish",
            )
          ],
        ),
      ),
    );
  }
}
