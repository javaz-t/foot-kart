import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: 250,
        child: ListView.builder(itemCount: 10,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
          return ScrollLoopAutoScroll(
              child: Container(
                margin: EdgeInsets.all(5),
                height: 150,width: 250,
                color: Colors.green,
                child: Text('dd'),
              ), //required
              scrollDirection: Axis.horizontal, //required
              delay: Duration(seconds: 1),
              duration: Duration(seconds: 50),
              gap: 25,
              reverseScroll: true,
              duplicateChild : 25,
              enableScrollInput : true,
              delayAfterScrollInput : Duration(seconds: 1)
          );
        }),
      ),
    );
  }
}
