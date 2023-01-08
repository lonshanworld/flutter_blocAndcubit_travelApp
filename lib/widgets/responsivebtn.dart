import "package:flutter/material.dart";

class ResponsiveButton extends StatelessWidget {

  final VoidCallback? fun;
  final double? width;
  final String? txt;
  final IconData? icn;
  final Color? btnClr;
  final Color? txtClr;
  final Color? icnClr;
  final double? txtsize;
  final double? icnsize;
  final Color? borderClr;
  final double? verticalsize;
  final double? horizontalsize;
  const ResponsiveButton({
    Key? key,
    this.fun,
    this.width,
    this.icn,
    this.txt,
    this.icnClr,
    this.btnClr,
    this.txtClr,
    this.borderClr,
    this.icnsize,
    this.txtsize,
    this.horizontalsize,
    this.verticalsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnClr),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          vertical: verticalsize ?? oneUnitHeight * 15,
          horizontal: horizontalsize ?? oneUnitWidth * 0,
        )),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(oneUnitHeight * 15),
            ),
            side: BorderSide(
              width: 2,
              color: borderClr ?? btnClr!,
            ),
          ),
        ),
      ),
      onPressed: fun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(txt != null)Text(txt!,style: TextStyle(
            color: txtClr ?? Colors.white,
            fontSize: txtsize ?? oneUnitHeight * 14,
          ),),
          if(icn != null)Icon(
            icn!,
            color: icnClr ?? Colors.white,
            size: icnsize ?? oneUnitHeight * 26,
          ),
        ],
      ),
    );
  }
}
