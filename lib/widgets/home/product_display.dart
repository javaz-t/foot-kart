import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';
import 'package:shoe_kart/screens/product_details.dart';
import 'package:shoe_kart/widgets/text.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
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
                  } );
  }
}