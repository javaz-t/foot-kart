import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/screens/favarate.dart';
import 'package:shoe_kart/widgets/accound/option_tile.dart';
import 'package:shoe_kart/widgets/filter/left_align_text.dart';

import '../widgets/accound/outline_button.dart';

class AccoundPage extends StatelessWidget {
  const AccoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const LeftAlignText(text: 'Hey userName !'),
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 5,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AccoudButton(
                            text: 'Order',
                            icon: Icons.local_shipping_outlined,
                            onTab: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BagPage()),
                              );
                            },
                          ),
                          AccoudButton(
                            text: 'WishList',
                            icon: Icons.favorite_border_outlined,
                            onTab: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavaratePage()),
                              );
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AccoudButton(
                            text: 'Coupons',
                            icon: Icons.local_offer_outlined,
                            onTab: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FavaratePage()));
                            },
                          ),
                          AccoudButton(
                            text: 'Help Center',
                            icon: Icons.help_center_outlined,
                            onTab: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FavaratePage()));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const LeftAlignText(
                        text: '  Accounds',
                        size: 25,
                      ),
                      OptionTile(
                        icon: Icons.manage_accounts_outlined,
                        title: 'Edit Profile ',
                        onTab: () {},
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      OptionTile(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Saved Cards and Wallets ',
                        onTab: () {},
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      OptionTile(
                        icon: Icons.import_contacts_outlined,
                        title: 'Saved Address',
                        onTab: () {},
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      OptionTile(
                        icon: Icons.translate_outlined,
                        title: 'Selected Language ',
                        onTab: () {},
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      OptionTile(
                        icon: Icons.notifications_active_outlined,
                        title: 'Notification Settings',
                        onTab: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const LeftAlignText(
                        text: '  My  Activity',
                        size: 25,
                      ),
                      OptionTile(
                        icon: Icons.manage_accounts_outlined,
                        title: 'My Review ',
                        onTab: () {},
                      ),
                      Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      OptionTile(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Question and Answer',
                        onTab: () {},
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    width:
                        (size.width) - 20, // Specify the width of the container
                    height: 60, // Specify the height of the container
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade400, // Border color
                        width: 2, // Border width
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout_outlined),
                          Text('Log Out'),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
