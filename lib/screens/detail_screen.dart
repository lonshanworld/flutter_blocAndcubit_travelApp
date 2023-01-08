import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/ui_constants/clrs.dart';

import 'package:travel_app_bloc_and_cubit/widgets/app_large_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_small_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/responsivebtn.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state){
        DetailState details = state as DetailState;
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  width: double.maxFinite,
                  height: oneUnitHeight * 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          details.singleplace.img
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              ),
              Positioned(
                left: oneUnitWidth * 20,
                right: oneUnitWidth * 20,
                height: oneUnitHeight * 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(
                        Icons.menu_open,
                        size: oneUnitHeight * 35,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.gps_fixed,
                        size: oneUnitHeight * 35,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: oneUnitHeight * 280,
                bottom: 0,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(oneUnitHeight * 30),
                      topRight: Radius.circular(oneUnitHeight * 30),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: oneUnitWidth * 20,
                      right: oneUnitWidth * 20,
                      bottom: oneUnitHeight * 30,
                      top: oneUnitHeight * 20,
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            txt: details.singleplace.name,
                            size: oneUnitHeight * 22,
                          ),
                          AppLargeText(
                            txt: "\$ ${details.singleplace.price}",
                            size: oneUnitHeight * 22,
                            clr: AppColors.mainColor,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: AppColors.mainColor,
                            size: oneUnitHeight * 20,
                          ),
                          SizedBox(width: oneUnitWidth * 5,),
                          AppSmallText(
                            txt: details.singleplace.location,
                            clr: AppColors.mainColor,
                            size: oneUnitHeight * 12,
                          ),
                        ],
                      ),
                      SizedBox(height: oneUnitHeight * 5,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index){
                              return Icon(
                                Icons.star,
                                color: (index + 1 <= details.singleplace.stars) ? AppColors.starColor : Colors.grey.shade400,
                                size: oneUnitHeight * 20,
                              );
                            }),
                          ),
                          SizedBox(width: oneUnitWidth * 10,),
                          AppSmallText(txt: "(${details.singleplace.stars})",clr: AppColors.textColor2,),
                        ],
                      ),
                      SizedBox(height: oneUnitHeight * 20,),
                      AppLargeText(
                        txt: "People",
                        size: oneUnitHeight * 18,
                        clr: Colors.black.withOpacity(0.8),
                      ),
                      AppText(
                        txt: "Number of people in your group",
                        clr: AppColors.mainTextColor,
                        size: oneUnitHeight * 12,
                      ),
                      SizedBox(height: oneUnitHeight * 10,),
                      Wrap(
                        children: List.generate(details.singleplace.people, (index){
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: oneUnitWidth * 6,
                            ),
                            width: oneUnitHeight * 50,
                            height: oneUnitHeight * 50,
                            child: ResponsiveButton(
                              txt: "${index + 1}",
                              btnClr: _selectedIndex == index ? Colors.black : Colors.grey.shade300,
                              txtClr: _selectedIndex == index ? Colors.white : Colors.black,
                              txtsize: oneUnitHeight * 16,
                              fun: (){
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: oneUnitHeight * 30,),
                      AppLargeText(
                        txt: "Description",
                        clr: Colors.black.withOpacity(0.8),
                        size: oneUnitHeight * 18,
                      ),
                      SizedBox(height: oneUnitHeight * 10,),
                      AppSmallText(
                        txt: details.singleplace.description,
                        clr: AppColors.mainTextColor,
                        size: oneUnitHeight * 12,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: oneUnitWidth * 30,
                right: oneUnitWidth * 30,
                bottom: oneUnitHeight * 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResponsiveButton(
                      icn: Icons.favorite_border,
                      icnClr: AppColors.mainColor,
                      icnsize: oneUnitHeight * 30,
                      btnClr: Colors.white,
                      borderClr: AppColors.mainColor,
                      verticalsize: oneUnitHeight * 22,
                      horizontalsize: oneUnitHeight * 22,
                    ),
                    ResponsiveButton(
                      icn: Icons.double_arrow_rounded,
                      icnClr: Colors.white,
                      icnsize: oneUnitHeight * 30,
                      txt: "Book Trip Now",
                      txtClr: Colors.white,
                      txtsize: oneUnitHeight * 14,
                      btnClr: AppColors.mainColor,
                      verticalsize: oneUnitHeight * 22,
                      horizontalsize: oneUnitHeight * 22,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
