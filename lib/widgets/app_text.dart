import "package:flutter/material.dart";

class AppText extends StatelessWidget {

  final double? size;
  final String txt;
  final Color? clr;
  const AppText({
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
        color: clr ?? Colors.black54,
        fontSize: size ?? oneUnitHeight * 26,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
