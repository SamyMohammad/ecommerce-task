part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class GetAllProductsLoadingState extends HomeState {}

class GetAllProductsFailureState extends HomeState {}

class GetAllProductsSuccessState extends HomeState {}
