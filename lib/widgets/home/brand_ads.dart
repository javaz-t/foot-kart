import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/model/ads_model.dart';

class BrandAds extends StatelessWidget {
  const BrandAds({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                  margin:const EdgeInsets.all(10),
                  height: 180,
                  child:ListView.builder(
                          itemCount: adsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            AdsModel adsData = adsList[index];

                            return Container(
                              margin:const EdgeInsets.all(5),
                              height: 250,
                              width: 350,
                              child: Image.network(
                               adsData.adsUrl, 
                                fit: BoxFit.cover,
                              ),
                            );
                          })
    );
  }
}