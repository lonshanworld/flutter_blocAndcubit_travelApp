import 'package:equatable/equatable.dart';

import '../models/data_model.dart';

abstract class CubitStates extends Equatable{

}

class InititalState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates{
  final List<DataModel> places;
  LoadedState({required this.places});

  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends CubitStates{
  final DataModel singleplace;
  DetailState({required this.singleplace});

  @override
  // TODO: implement props
  List<Object> get props => [singleplace];
}

class LogoutState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}