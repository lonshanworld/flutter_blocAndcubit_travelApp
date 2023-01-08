import "package:flutter/material.dart";

class AppLargeText extends StatelessWidget {

  final double? size;
  final String txt;
  final Color? clr;
  const AppLargeText({
    Key? key,
    required this.txt,
    this.size,
    this.clr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitHeight = deviceHeight/781.091;
    return Text(
      txt,
      style: TextStyle(
        color: clr ?? Colors.black,
        fontSize: size ?? oneUnitHeight * 30,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
