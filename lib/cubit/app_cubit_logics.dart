import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/screens/detail_screen.dart';
import 'package:travel_app_bloc_and_cubit/screens/nav_screens/main_screen.dart';
import 'package:travel_app_bloc_and_cubit/screens/welcome_screen.dart';

import '../screens/nav_screens/my_screen.dart';
import '../ui_constants/clrs.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (ctx, state){
          if(state is WelcomeState){
            return const WelcomeScreen();
          }if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            );
          }if(state is LoadedState){
            return const MainScreen();
          }if(state is DetailState){
            return const DetailScreen();
          }if(state is LogoutState){
            return const MyScreen();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
