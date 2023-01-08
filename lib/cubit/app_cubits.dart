import 'package:bloc/bloc.dart';
import 'package:travel_app_bloc_and_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc_and_cubit/services/data_services.dart';

import '../models/data_model.dart';

class AppCubits extends Cubit<CubitStates>{
  final DataServices data;
  AppCubits({required this.data}) : super(InititalState()){
    emit(WelcomeState());
  }

  var places =[];

  void getData()async{
    places = [];
    try{
      emit(LoadingState());
      places =await data.getInfo();
      emit(LoadedState(places: places as List<DataModel>));
    }catch(err){
      rethrow;
    }
  }

  detailPage(DataModel data){
    emit(DetailState(singleplace: data));
  }

  goHome(){
    emit(LoadedState(places: places as List<DataModel>));
  }

  goStart(){
    emit(WelcomeState());
  }

}