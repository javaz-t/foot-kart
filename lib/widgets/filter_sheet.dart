import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/widgets/text.dart';

import '../util/const.dart';

class Filter extends StatefulWidget {
  Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues _currentRangeValues = const RangeValues(1000, 2000);
  int selectedSize = 0;
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 550,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                MediumFont(
                  font: 'Filters',
                  size: 40,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Catergory',
                      style: TextStyle(fontSize: 30),
                    )),
                Container(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: shoCategory.length,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(60),
                            onTap: () {
                              setState(() {
                                selectedCategory = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 900,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: selectedCategory != index
                                      ? Colors.white
                                      : Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                shoCategory[index].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedCategory != index
                                        ? Colors.grey
                                        : Colors.white,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Size',
                      style: TextStyle(fontSize: 30),
                    )),
                Container(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: shoeSize.length,
                      itemBuilder: (contex, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(60),
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 50,
                              decoration: BoxDecoration(
                                  color: selectedSize != index
                                      ? Colors.white
                                      : Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                shoeSize[index].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedSize != index
                                        ? Colors.grey
                                        : Colors.white),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 30),
                    )),
                RangeSlider(
                  values: _currentRangeValues,
                  min: 500,
                  max: 4000,
                  divisions: 100,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_currentRangeValues.start.round().toString()),
                    Text(_currentRangeValues.end.round().toString())
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
