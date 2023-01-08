import "package:flutter/material.dart";

import 'package:travel_app_bloc_and_cubit/screens/nav_screens/search.dart';

import 'package:travel_app_bloc_and_cubit/widgets/app_large_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: oneUnitHeight * 65,
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search,color: Colors.grey,size: oneUnitHeight * 40,),
          ),
          SizedBox(width: oneUnitWidth * 20,),
        ],
      ),
      body: Center(
        child: AppLargeText(
          txt: "Search to find cities",
          size: oneUnitHeight * 30,
          clr: Colors.black54,
        ),
      ),
    );
  }
}


