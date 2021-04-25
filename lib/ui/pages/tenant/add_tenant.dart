import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/pages/tenant/register_tenant_unit.dart';
import 'package:lt_app/ui/widgets/lt_button.dart';
import 'package:lt_app/ui/widgets/textfield/country_text_field.dart';
import 'package:lt_app/ui/widgets/textfield/lt_form_field.dart';

class AddTenant extends StatefulWidget {
  @override
  _AddTenantState createState() => _AddTenantState();
}

class _AddTenantState extends State<AddTenant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Tenant Registration',
                  style: GoogleFonts.slabo27px(fontSize: 25),
                ),
                subtitle: Text(
                  "If Tenant Exists in the system he/she do not need to be registered again do direct to register units",
                  style: GoogleFonts.slabo27px(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Icon(Icons.image_outlined, size: 90),
                ),
              ),
              ListTile(
                title: Text(
                  'Click to Add Image',
                  style: GoogleFonts.slabo27px(),
                ),
                subtitle: Text(
                  "Make sure the image is an exact image of the Tenant",
                  style: GoogleFonts.slabo27px(),
                ),
              ),
              LtFormField(
                label: "Full Name",
              ),
              CountryTextField(
                label: "Phone Number",
              ),
              LtFormField(
                label: "Indentification Number",
              ),
              LtFormField(
                label: "Email",
              ),
              LtButton(
                text: "Create Tenant",
              ),
              LtButton(
                text: "Register Tenant Unit",
                onpress: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterTenantUnit())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
