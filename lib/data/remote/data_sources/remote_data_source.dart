import 'package:ecommerce_task/data/remote/models/requests/registeration_request_rm.dart';
import 'package:ecommerce_task/data/remote/models/responses/register.dart';

import '../models/requests/sign_in_request_rm.dart';
import '../models/responses/login.dart';
import '../models/responses/product.dart';
import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<Login> login(SignInRequestRM signInRequestRM);

  Future<Register> register(RegistrationRequestRM registrationRequestRM);
  Future<List<GetProductResponse>> getProducts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<Login> login(SignInRequestRM signInRequestRM) async {
    return await _appServiceClient.login(
        signInRequestRM.phoneNumber, signInRequestRM.password);
  }

  @override
  Future<Register> register(RegistrationRequestRM registrationRequestRM) async {
    return await _appServiceClient.register(registrationRequestRM);
  }

  @override
  Future<List<GetProductResponse>> getProducts(
      {String? sort, int? limit}) async {
    return await _appServiceClient.getProducts(limit: limit, sort: sort);
  }
}
