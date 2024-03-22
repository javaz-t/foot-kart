import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';

class BrandAds extends StatelessWidget {
  const BrandAds({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
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
                );
  }
}