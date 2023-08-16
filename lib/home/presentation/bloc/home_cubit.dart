import 'package:bloc/bloc.dart';
import 'package:dio_example/home/data/model/country.dart';
import 'package:dio_example/home/data/model/todo_model.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _useCase;
  HomeCubit(this._useCase) : super(const HomeInitial());


  Future<dynamic> getCountryInfo() async {
    try{
      emit(const HomeLoading());
      var result = await _useCase.getCountryInfo();
      emit(HomeLoaded(result));
    }catch(error){
      emit(HomeError(error.toString()));
    }
  }

  Future<dynamic> getTodoList() async{
    try{
      emit(const HomeTodosLoading());
      var result = await _useCase.getTodosList();
      emit(HomeTodosLoaded(result));
    }catch(error){
      emit(HomeTodosError(error.toString()));
    }
  }
}
