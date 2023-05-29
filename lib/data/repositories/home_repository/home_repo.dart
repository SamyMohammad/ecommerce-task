import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/data/remote/models/responses/product.dart';

abstract class HomeRepo {
  Future<Either<dynamic, List<GetProductResponse>>> getProducts(
      {String? sort, int? limit});
}
