import 'package:flutter/material.dart';

import '../../util/const.dart';
class SelectColor extends StatefulWidget {
  const SelectColor({super.key});

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  int selectedColor =0;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoeColors.length,
              itemBuilder: (contex, index) {
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedColor= index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 50,
                      decoration: BoxDecoration(
                          color: shoeColors[index],
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),

                );
              }),
        ),
        Text(colorNames[selectedColor]),
      ],
    );
  }
}
