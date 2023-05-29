import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/data/remote/models/requests/registeration_request_rm.dart';

import '../../remote/data_sources/remote_data_source.dart';
import '../../remote/models/requests/sign_in_request_rm.dart';
import '../../remote/models/responses/login.dart';
import '../../remote/models/responses/register.dart';
import '../../remote/network/error_handler.dart';
import '../../remote/network/failures/login_failure.dart';
import '../../remote/network/network_info.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final RemoteDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;

  // final UserSecureStorage userSecureStorage;
  AuthRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<dynamic, Login>> login(SignInRequestRM signInRequestRM) async {
    if (await networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await remoteDataSource.login(signInRequestRM);

        if (response.token != null) {
          // success
          // return either right
          // return data
          print(response.token);

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return const Left('login failed');
        }
      } catch (error) {
        return const Left('login failed');
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<dynamic, Register>> register(
      RegistrationRequestRM registrationRequestRM) async {
    if (await networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await remoteDataSource.register(registrationRequestRM);

        if (response.id == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }
}
