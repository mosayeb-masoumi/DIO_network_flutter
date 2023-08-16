import 'package:dio_example/home/domain/repository/home_repository.dart';

class HomeUseCase extends HomeRepository {
  final HomeRepository _repository;
  HomeUseCase(this._repository);

  @override
  Future getCountryInfo() {
    return _repository.getCountryInfo();
  }

  @override
  Future getTodosList() {
    return _repository.getTodosList();
  }

}