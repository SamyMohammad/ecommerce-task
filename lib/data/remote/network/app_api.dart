import 'package:dio/dio.dart';
import 'package:ecommerce_task/data/remote/models/responses/register.dart';
import 'package:retrofit/http.dart';

import '../../../app/constants.dart';
import '../models/requests/registeration_request_rm.dart';
import '../models/responses/login.dart';
import '../models/responses/product.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.signInUrl)
  @FormUrlEncoded()
  Future<Login> login(
    @Field('username') String username,
    @Field("password") String password,
  );

  @POST(Constants.signUpUrl)
  Future<Register> register(
      @Body() RegistrationRequestRM registrationRequestRM);

  @GET(Constants.getProducts)
  Future<List<GetProductResponse>> getProducts({
    @Query('limit') int? limit,
    @Query('sort') String? sort,
  });
}
