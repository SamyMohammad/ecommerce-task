import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/home_repository/home_repo.dart';
import '../../../data/repositories/profile_repository/profile_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.profileRepo, this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  final ProfileRepo profileRepo;
  List<GetProductResponse>? products;

  int? limit;
  String? sort;
  TextEditingController editingController = TextEditingController();

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> getAllProducts({String? query}) async {
    emit(GetAllProductsLoadingState());
    homeRepo.getProducts(limit: limit, sort: sort).then(
          (value) => value.fold((l) {
            if (kDebugMode) {
              print(l);
            }
            emit(GetAllProductsFailureState());
          }, (r) {
            products = r;
            products = products?.where((patient) {
              final name = patient.title!.toLowerCase();
              final input = query?.toLowerCase();
              return name.startsWith(input ?? '');
            }).toList();
            emit(GetAllProductsSuccessState());
          }),
        );
  }
}
