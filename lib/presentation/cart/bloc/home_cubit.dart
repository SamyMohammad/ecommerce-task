import 'package:ecommerce_task/app/di.dart';
import 'package:ecommerce_task/data/local/data_sources/product_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/home_repository/home_repo.dart';
import '../../../data/repositories/profile_repository/profile_repo.dart';

part 'home_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.profileRepo, this.homeRepo) : super(CartInitial());
  final HomeRepo homeRepo;
  final ProfileRepo profileRepo;
  List<ProductCMData>? products;
  late double allPrice;

  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> getPrice() async {
    allPrice = 0;
    await getAllProducts();
    products?.forEach((element) {
      allPrice += element.price;
    });
    print(allPrice);
  }

  Future<void> getAllProducts() async {
    products = await instance<AppDatabase>().getALlProductCM();
    print(products?.length);
    emit(GetProductsState());
  }
}
