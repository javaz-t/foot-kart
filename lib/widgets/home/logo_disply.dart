import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/firebase/firebase_collections.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/model/logo_model.dart';

class LogoDisplay extends StatelessWidget {
  const LogoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  height: 60,
                  child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: logoList.length,
                            itemBuilder: (context, index) {
                              LogoModelClass logoDetails =
                                  logoList[index];

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
                                          image: NetworkImage(logoDetails.logoUrl),
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
                                        logoDetails.logoName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })
                );
  }
}