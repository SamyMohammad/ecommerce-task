import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/data/remote/models/responses/product.dart';

import '../../remote/data_sources/remote_data_source.dart';
import '../../remote/network/error_handler.dart';
import '../../remote/network/failures/login_failure.dart';
import '../../remote/network/network_info.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteDataSourceImpl _remoteDataSource;
  final NetworkInfo _networkInfo;

  HomeRepoImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<dynamic, List<GetProductResponse>>> getProducts(
      {String? sort, int? limit}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response =
            await _remoteDataSource.getProducts(sort: sort, limit: limit);

        // success
        // return either right
        // return data
        print(response[0]);

        return Right(response);
      } catch (error) {
        return const Left('get products failed');
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }
}
