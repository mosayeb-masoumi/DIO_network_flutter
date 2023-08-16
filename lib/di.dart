
import 'package:dio_example/home/data/data_source/home_data_source.dart';
import 'package:dio_example/home/data/repository_impl/home_repository_impl.dart';
import 'package:dio_example/home/domain/repository/home_repository.dart';
import 'package:dio_example/home/domain/usecase/home_usecase.dart';
import 'package:dio_example/home/presentation/bloc/home_cubit.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;
void setUpDI(){

  // bloc example
  sl.registerLazySingleton<HomeDataSource>(() => IHomeDataSource());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeUseCase>(() => HomeUseCase(sl()));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(sl()));
}