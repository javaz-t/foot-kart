import 'package:flutter/material.dart';
import 'package:shoe_kart/widgets/text.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',style: TextStyle(fontSize: 25,color: Colors.grey),),
              Text('\$ 1500',style: TextStyle(fontSize: 28,color: Colors.black),),
           ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Delivary',style: TextStyle(fontSize: 25,color: Colors.grey),),
              Text('\$ 150',style: TextStyle(fontSize: 28,color: Colors.black),),
            ],
          ),
          Divider(color: Colors.grey,endIndent: 15,indent: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Total',style: TextStyle(fontSize: 28,color: Colors.black),),
              Text('\$ 1500',style: TextStyle(fontSize: 28,color: Colors.black),),
            ],
          ),
          Container(

            child:Center(child: Text('Checkout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),),
            height: 45,width:double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent),
          )
        ],
      ),
      ),
      body: SafeArea(
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
                MediumFont(font: 'My Cart', size: 20),
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                    margin: EdgeInsets.all(6),
                    height: 170,
                    width: double.infinity,
                    // color: Color.fromARGB(255, 203, 153, 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //SizedBox(width: 10,),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MediumFont(font: 'NIke Shoes24'),
                            PriceFont(
                              price: 1600,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove_outlined,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_circle_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              '40',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold,color: Colors.blueAccent),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline_outlined,
                                size: 40,color: Colors.red,
                              ),
                            ),
                          ],
                        )
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
