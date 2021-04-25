import 'package:flutter/material.dart';
import 'package:lt_app/ui/pages/starterPages/auth_page.dart';
import 'package:lt_app/ui/widgets/lt_app_bar.dart';
import 'package:lt_app/ui/widgets/lt_button.dart';
import 'package:lt_app/ui/widgets/lt_corousel.dart';

class StarterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LtAppBar(
            title: "Rental App",
            subtitle: "Welcome to Rental and thank you for choosing us",
          ),
          LtCorousel(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  LtButton(
                    text: "Log In",
                    onpress: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AuthPage())),
                  ),
                  LtButton(
                    text: "Learn More",
                    onpress: () {},
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
