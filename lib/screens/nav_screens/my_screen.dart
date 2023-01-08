import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_large_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/responsivebtn.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitHeight = deviceHeight/781.091;

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLargeText(txt: "Customization for user profile",size: 24,clr: Colors.brown,),
            const SizedBox(height: 50,),
            SizedBox(
              width: 150,
              child: ResponsiveButton(
                icn: Icons.logout,
                txt: "Log out",
                icnsize: oneUnitHeight * 40,
                txtsize: oneUnitHeight * 20,
                txtClr: Colors.black,
                icnClr: Colors.black,
                btnClr: Colors.grey.shade400,
                fun: (){
                  BlocProvider.of<AppCubits>(context).goStart();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}