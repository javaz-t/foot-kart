import 'package:flutter/material.dart';

import '../widgets/text.dart';
class FavaratePage extends StatelessWidget {
  const FavaratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                  ),
                ),
                MediumFont(font: 'My Favorite', size: 20),
                SizedBox(width: 30,)

              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(6),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                          height: 120,
                          width: 120,

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MediumFont(font: 'NIke Shoes24'),
                            PriceFont(
                              price: 1600,
                            ),

                          ],
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_outlined,size: 35,color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
