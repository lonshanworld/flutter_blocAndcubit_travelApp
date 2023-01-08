import "package:flutter/material.dart";

class AppSmallText extends StatelessWidget {

  final double? size;
  final String txt;
  final Color? clr;
  final double? lineHeight;
  final double? wordSpace;
  const AppSmallText({
    Key? key,
    required this.txt,
    this.size,
    this.clr,
    this.lineHeight,
    this.wordSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;
    return Text(
      txt,
      style: TextStyle(
        color: clr ?? Colors.black,
        fontSize: size ?? oneUnitHeight * 14,
        wordSpacing: wordSpace ?? oneUnitWidth * 3,
        height: lineHeight ?? oneUnitHeight * 1.5,
      ),
    );
  }
}
