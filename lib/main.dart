
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubit_logics.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (ctx) => AppCubits(
          data: DataServices(),
        ),
        child: const AppCubitLogics(),
      ),
    );
  }

}

