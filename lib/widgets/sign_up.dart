import 'package:flutter/material.dart';
///Title
class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    );
  }
}
///SubTitle
class SubTitleText extends StatelessWidget {
  final String subTitle;
  const SubTitleText({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
//text align to left side
class LeftAlignText extends StatelessWidget {
  final String text;
  const LeftAlignText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ));
  }
}

class ButtomText extends StatelessWidget {
  final String text;
  final String textButton;
  final Function onTab;
  const ButtomText({super.key, required this.text, required this.textButton, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: TextStyle(color: Colors.black),),
        TextButton(onPressed: (){
          onTab();
        }, child: Text(textButton,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
      ],
    );
  }
}
