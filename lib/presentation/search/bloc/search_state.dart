part of 'search_cubit.dart';

abstract class SearchState {
  const SearchState();
}

class HomeInitial extends SearchState {}

class GetAllProductsLoadingState extends SearchState {}

class GetAllProductsFailureState extends SearchState {}

class GetAllProductsSuccessState extends SearchState {}
