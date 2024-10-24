import 'package:flutter_bloc/flutter_bloc.dart';

class CauntriCubit extends Cubit<int>{
  CauntriCubit(): super(0);

  void increment(){
    emit(state + 1);
  }

  void dincrment(){
    emit(state - 1);
  }

}