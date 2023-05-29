import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/home_repository/home_repo.dart';
import '../../../data/repositories/profile_repository/profile_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.profileRepo, this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  final ProfileRepo profileRepo;
  List<GetProductResponse>? products;
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllProducts() async {
    emit(GetAllProductsLoadingState());
    homeRepo.getProducts().then(
          (value) => value.fold((l) {
            if (kDebugMode) {
              print(l);
            }
            emit(GetAllProductsFailureState());
          }, (r) {
            products = r;
            emit(GetAllProductsSuccessState());
          }),
        );
  }
}
