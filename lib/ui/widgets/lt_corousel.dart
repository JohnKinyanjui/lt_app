import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lt_app/ui/widgets/lt_corousel_item.dart';

class LtCorousel extends StatelessWidget {
  const LtCorousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController _controller = CarouselController();

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          CarouselSlider(
            items: [
              LtCorouselItem(
                icon: Icons.business,
                title: "Manage your building from the confort of your phone.",
              ),
              LtCorouselItem(
                icon: Icons.account_balance_wallet_outlined,
                title:
                    "Manage you earnings easily without any stress and worry.",
              ),
              LtCorouselItem(
                icon: Icons.airplanemode_active_rounded,
                title: "Log in Securely to your account easily from anywhere.",
              ),
            ],
            carouselController: _controller,
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              initialPage: 0,
            ),
          ),
          Row(
            children: [
              Container(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
