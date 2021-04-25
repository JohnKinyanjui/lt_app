import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lt_app/ui/pages/starterPages/starter_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StarterPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.business,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Rental App",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
