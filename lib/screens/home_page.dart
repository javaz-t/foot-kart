import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:shoe_kart/widgets/home/brand_ads.dart';
import 'package:shoe_kart/widgets/home/filter_button.dart';
import 'package:shoe_kart/widgets/home/logo_disply.dart';
import 'package:shoe_kart/widgets/home/product_display.dart';
import 'package:shoe_kart/widgets/login/sign_up.dart';
import '../widgets/home/search_bar.dart';

class HomePage extends StatelessWidget {
  const   HomePage({super.key});
@override
  Widget build(BuildContext context) {
    return const Scaffold(
  //    drawer: DrawerEnable(),
      body: SafeArea(
          child:  Padding(
                    padding:  EdgeInsets.all(10),
                    child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      
                      Text(
                        'Foot Kart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                   HomeSearchBar(),
                  LogoDisplay(),
                    Divider(
                    indent: 10,
                    endIndent: 10,
                  ),
                   LeftAlignText(text: 'Popular Shoes'),
                 BrandAds(),
                   Divider(
                    indent: 40,
                    endIndent: 40,
                  ),
                 ProductDisplay() ],
              ),
            ),
            FilterButton(),
                    ]),
                  ),
      ),
    );
  }
}
         
             