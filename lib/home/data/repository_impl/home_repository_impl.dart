import 'package:dio_example/home/data/data_source/home_data_source.dart';
import 'package:dio_example/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{

  final HomeDataSource _dataSource;
  HomeRepositoryImpl(this._dataSource);

  @override
  Future getCountryInfo() {
    return _dataSource.getCountryInfo();
  }

  @override
  Future getTodosList() {
    return _dataSource.getTodosList();
  }

}