import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/ui_constants/clrs.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_large_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_small_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/responsivebtn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final List _images = [
    "assets/images/welcome-one.png",
    "assets/images/welcome-two.png",
    "assets/images/welcome-three.png"
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _images.length,
        itemBuilder: (ctx, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  _images[index],
                )
              )
            ),
            child: Container(
              margin: EdgeInsets.only(
                top: oneUnitHeight * 100,
                left: oneUnitWidth * 30,
                right: oneUnitWidth * 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        txt: "Trips",
                      ),
                      const AppText(
                        txt: "Mountain",
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: oneUnitHeight * 20,
                        ),
                        width: oneUnitWidth * 250,
                        child: const AppSmallText(
                          txt: "Mountain hikes give you an incredible sense of freedom along with endurance text",
                          clr: AppColors.textColor2,
                        ),
                      ),
                      SizedBox(
                        height: oneUnitHeight * 25,
                      ),
                      ResponsiveButton(
                        icn: Icons.double_arrow,
                        icnsize: oneUnitHeight * 30,
                        btnClr: AppColors.mainColor,
                        verticalsize: oneUnitHeight * 10,
                        horizontalsize: oneUnitWidth * 30,
                        fun: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(_images.length, (idx) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: oneUnitHeight * 4,
                        ),
                        width: oneUnitWidth * 10,
                        height: index == idx ? oneUnitHeight * 30 : oneUnitHeight * 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            oneUnitHeight * 10,
                          ),
                          color: index == idx ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
