import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';

import 'package:shoe_kart/screens/product_details.dart';
import 'package:shoe_kart/widgets/rounded_icon_button.dart';
import 'package:shoe_kart/widgets/sign_up.dart';
import 'package:shoe_kart/widgets/text.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/home/search_bar.dart';

class HomePage extends StatefulWidget {
  const   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //    drawer: DrawerEnable(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Row(
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
                const HomeSearchBar(),
                SizedBox(
                  height: 60,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: logoRef.snapshots(),
                      builder: ((context, snapshot) {
                        List<QueryDocumentSnapshot<Object?>>
                            logoQueryDocumentSnapshot = snapshot.data!.docs;

                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: logoQueryDocumentSnapshot.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot logoDetails =
                                  logoQueryDocumentSnapshot[index];

                              return Container(
                                margin: const EdgeInsets.all(2),
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(logoDetails['logoUrl']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          right: 18,
                                          left: 6),
                                      child: Text(
                                        logoDetails['logoName'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      })),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                const LeftAlignText(text: 'Popular Shoes'),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 180,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: adsRef.snapshots(),
                    builder: (context, snapshot) {
                      List<QueryDocumentSnapshot<Object?>>
                          AdsQueryDocumentSnapshot = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: AdsQueryDocumentSnapshot.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            DocumentSnapshot adsImage =
                                AdsQueryDocumentSnapshot[index];

                            return Container(
                              margin: EdgeInsets.all(5),
                              height: 250,
                              width: 350,
                              child: Image.network(
                                adsImage['adsUrl'], 
                                fit: BoxFit.cover,
                              ),
                            );
                          });
                    },
                  ),
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                ),
                StreamBuilder(
                  stream: productRef.snapshots(),
                  builder: (context,snapshot){
  List<QueryDocumentSnapshot<Object?>>productQueryDocumentSnapshot = snapshot.data!.docs;
                    
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productQueryDocumentSnapshot.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                      itemBuilder: (BuildContext context, int index) {
                         DocumentSnapshot productData = productQueryDocumentSnapshot[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(productData: productQueryDocumentSnapshot[index],)),
                            );
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height:350,
                              width: 150, 
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 160, 
                                    width: 165,
                                    child: Image.network(
                                      productData['images'][0],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: MediumFont(
                                          font: productData['name'],
                                          size: 15,
                                        )),
                                  ),
                                  PriceFont(price: productData['price'])
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                  } ),
              ],
            ),
          ),
          Positioned(
            bottom: 47,
            right: 30,
            child: RoundedIconButton(
                iconData: Icons.tune_outlined,
                onPressed: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return FilterPage(); // Assuming `Filter` is a widget that you've defined.
                    },
                  );
                }),
          ),
        ]),
      )),
    );
  }
}
