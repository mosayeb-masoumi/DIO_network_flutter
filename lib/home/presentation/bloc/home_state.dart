part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final Country result;
  const HomeLoaded(this.result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;
}


class HomeError extends HomeState {
  final String error;
  const HomeError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}


//////////////  todos //////////////////////////////

class HomeTodosLoading extends HomeState {
  const HomeTodosLoading();
}

class HomeTodosLoaded extends HomeState {
  final List<TodoModel> result;
  const HomeTodosLoaded(this.result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeTodosLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;
}


class HomeTodosError extends HomeState {
  final String error;
  const HomeTodosError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeError &&
              runtimeType == other.runtimeType &&
              error == other.error;

  @override
  int get hashCode => error.hashCode;
}