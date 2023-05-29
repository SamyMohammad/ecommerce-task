part of 'home_cubit.dart';

abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {}

class GetProductsState extends CartState {}

class DeleteProductState extends CartState {}
