import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/lt_main_page.dart';
import 'package:lt_app/services/authService.dart';
import 'package:lt_app/ui/widgets/textfield/country_text_field.dart';
import 'package:lt_app/ui/widgets/lt_app_bar.dart';
import 'package:lt_app/ui/widgets/lt_button.dart';
import 'package:lt_app/ui/widgets/textfield/lt_form_field.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    String _phoneCode = "254";
    final _phoneNumber = TextEditingController();
    final _password = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          LtAppBar(
            title: "Log In",
            subtitle: "Please enter your credentials",
            onpress: () => Navigator.of(context).pop(),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 20),
                CountryTextField(
                  label: "Phone Number",
                  controller: _phoneNumber,
                  onChanged: (i) {
                    setState(() {
                      _phoneCode = i;
                    });
                  },
                ),
                SizedBox(height: 10),
                LtFormField(
                  controller: _password,
                  label: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                LtButton(
                    text: "Log In",
                    onpress: () async {
                      await EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
                      final result = await AuthMerchant(
                          "$_phoneCode${_phoneNumber.text}", _password.text);
                      if (result == "None") {
                        EasyLoading.showError('Please check your credentils');
                        EasyLoading.dismiss();
                      } else {
                        EasyLoading.showSuccess('Success!');
                        EasyLoading.dismiss();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LtMainPage()));
                      }
                    }),
                TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?",
                        style: GoogleFonts.poppins(color: Colors.black)))
              ]),
            ),
          ))
        ],
      ),
    );
  }
}
