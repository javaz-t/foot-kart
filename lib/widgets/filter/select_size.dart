import 'package:flutter/material.dart';

import '../../util/const.dart';
class SizeCategory extends StatefulWidget {
  final int iteamCount;
  final List<String> text;
  const SizeCategory({super.key, required this.iteamCount, required this.text});

  @override
  State<SizeCategory> createState() => _SizeCategoryState();
}

class _SizeCategoryState extends State<SizeCategory> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:widget.iteamCount,
          itemBuilder: (contex, index) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () {
                  setState(() {
                    selectedSize = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: selectedSize != index
                          ? Colors.white
                          : Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Text(
                          widget.text[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedSize != index
                                  ? Colors.grey
                                  : Colors.white),
                        ),
                      )),
                ),
              ),
            );
          }),
    );
  }
}
