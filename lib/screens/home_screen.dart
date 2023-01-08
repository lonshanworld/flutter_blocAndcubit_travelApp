

import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubits.dart';
import 'package:travel_app_bloc_and_cubit/ui_constants/clrs.dart';
import 'package:travel_app_bloc_and_cubit/widgets/app_large_text.dart';
import 'package:travel_app_bloc_and_cubit/widgets/responsivebtn.dart';

import '../widgets/app_small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  final _icnList = [
    {
      "_iconData" :  Icons.circle,
      "_label" : "Balloning",
      "_color1" : Colors.purple.shade600,
      "_color2" : Colors.purple.shade100,
    },
    {
      "_iconData" :  Icons.hiking,
      "_label" : "Hiking",
      "_color1" : Colors.red.shade600,
      "_color2" : Colors.red.shade100,
    },
    {
      "_iconData" :  Icons.kayaking,
      "_label" : "Kayaking",
      "_color1" : Colors.green.shade600,
      "_color2" : Colors.green.shade100,
    },
    {
      "_iconData" :  Icons.scuba_diving,
      "_label" : "Snorkling",
      "_color1" : Colors.orange.shade600,
      "_color2" : Colors.orange.shade100,
    },
    {
      "_iconData" :  Icons.directions_walk,
      "_label" : "Walking",
      "_color1" : Colors.blue.shade600,
      "_color2" : Colors.blue.shade100,
    },
  ];

  List<bool> emotion = [false,false,false,false];


  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final oneUnitWidth = deviceWidth/392.727;
    final oneUnitHeight = deviceHeight/781.091;
    TabController _tabController = TabController(length: 3, vsync: this);

    return BlocBuilder<AppCubits, CubitStates>(
      builder: (ctx, state){
        if(state is LoadedState){
          var infos = state.places;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: oneUnitHeight * 65,
              centerTitle: false,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: (){},
                child: Icon(
                  Icons.menu_open,
                  size: oneUnitHeight * 40,
                  color: Colors.black54,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: oneUnitHeight * 5,
                  ),
                  width: oneUnitHeight * 55,
                  // height: Dimensions.oneUnitHeight * 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(oneUnitHeight * 10)),
                    color: Colors.grey,
                  ),
                  child: Icon(Icons.person,size: oneUnitHeight * 30,),
                ),
                SizedBox(
                  width: oneUnitWidth * 30,
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: oneUnitWidth * 20,
                  ),
                  child: AppLargeText(
                    txt: "Discover",
                    size: oneUnitHeight * 34,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: oneUnitWidth * 20,
                    ),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.8),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                      clr: AppColors.mainColor,
                      radius: oneUnitHeight * 7,
                    ),
                    tabs: const[
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotions",
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: oneUnitHeight * 15,
                  ),
                  height: oneUnitHeight * 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount : infos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(infos[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: oneUnitWidth * 15,
                                ),
                                width: oneUnitWidth * 220,
                                // height: Dimensions.oneUnitHeight * 500,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(oneUnitHeight * 20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        infos[index].img,
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                            );
                          }
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: oneUnitWidth * 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: AppSmallText(
                                txt: " “Travel isn’t always pretty. It isn’t always comfortable. Sometimes it hurts, it even breaks your heart. But that’s okay. The journey changes you; it should change you. It leaves marks on your memory, on your consciousness, on your heart, and on your body. You take something with you. Hopefully, you leave something good behind.”",
                                clr: Colors.black54,
                                size: oneUnitHeight * 14,
                              ),
                            ),
                            SizedBox(height: oneUnitHeight * 10,),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: AppLargeText(
                                txt: "Anthony Bourdain",
                                size: oneUnitHeight * 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ResponsiveButton(
                                fun: (){
                                  setState(() {
                                    emotion[0] = !emotion[0];
                                  });
                                },
                                icn: Icons.emoji_emotions_outlined,
                                btnClr: emotion[0] ? Colors.red.shade100 : Colors.grey.shade200,
                                icnClr: emotion[0] ? Colors.red : Colors.grey,
                                icnsize: oneUnitHeight * 45,
                                verticalsize: oneUnitHeight * 15,
                                horizontalsize: oneUnitHeight * 15,
                              ),
                              ResponsiveButton(
                                fun: (){
                                  setState(() {
                                    emotion[1] = !emotion[1];
                                  });
                                },
                                icn: Icons.emoji_emotions_outlined,
                                btnClr: emotion[1] ? Colors.blue.shade100: Colors.grey.shade200,
                                icnClr: emotion[1] ? Colors.blue : Colors.grey,
                                icnsize: oneUnitHeight * 45,
                                verticalsize: oneUnitHeight * 15,
                                horizontalsize: oneUnitHeight * 15,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ResponsiveButton(
                                fun: (){
                                  setState(() {
                                    emotion[2] = !emotion[2];
                                  });
                                },
                                icn: Icons.emoji_emotions_outlined,
                                btnClr: emotion[2] ? Colors.green.shade100 : Colors.grey.shade200,
                                icnClr: emotion[2] ? Colors.green : Colors.grey,
                                icnsize: oneUnitHeight * 45,
                                verticalsize: oneUnitHeight * 15,
                                horizontalsize: oneUnitHeight * 15,
                              ),
                              ResponsiveButton(
                                fun: (){
                                  setState(() {
                                    emotion[3] = !emotion[3];
                                  });
                                },
                                icn: Icons.emoji_emotions_outlined,
                                btnClr: emotion[3] ? Colors.yellow.shade200 : Colors.grey.shade200,
                                icnClr: emotion[3] ? Colors.orange : Colors.grey,
                                icnsize: oneUnitHeight * 45,
                                verticalsize: oneUnitHeight * 15,
                                horizontalsize: oneUnitHeight * 15,
                              ),
                                                         ],
                          ),
                                                 ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: oneUnitHeight * 12,
                    horizontal: oneUnitWidth * 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        txt: "Explore More",
                        size: oneUnitHeight * 20,
                      ),
                      const AppSmallText(
                        txt: "See all",
                        clr: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: oneUnitHeight * 130,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, idx){
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: oneUnitWidth * 15,
                            ),
                            child: ResponsiveButton(
                              fun: (){
                                print("Ok");
                              },
                              icn: _icnList[idx]["_iconData"] as IconData,
                              btnClr: _icnList[idx]["_color2"] as Color,
                              icnClr: _icnList[idx]["_color1"] as Color,
                              icnsize: oneUnitHeight * 45,
                              verticalsize: oneUnitHeight * 15,
                              horizontalsize: oneUnitHeight * 15,
                            ),
                          ),
                          SizedBox(
                            height: oneUnitHeight * 10,
                          ),
                          AppSmallText(txt: _icnList[idx]["_label"] as String,clr: AppColors.textColor2,),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }else{
          return const Center(
            child: Text("Something is wrong"),
          );
        }
      },
    );
  }
}

class CircleTabIndicator extends Decoration{

  final Color clr;
  final double radius;
  const CircleTabIndicator({
    required this.clr,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    // throw UnimplementedError();
    return _CirclePainter(clr: clr, radius: radius);
  }

}

class _CirclePainter extends BoxPainter{

  final Color clr;
  final double radius;
  _CirclePainter({
    required this.clr,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = clr;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 , configuration.size!.height - radius/2);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
