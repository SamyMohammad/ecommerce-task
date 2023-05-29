import 'package:dartz/dartz.dart';
import 'package:ecommerce_task/data/remote/models/requests/registeration_request_rm.dart';
import 'package:ecommerce_task/data/remote/models/responses/register.dart';

import '../../remote/models/requests/sign_in_request_rm.dart';
import '../../remote/models/responses/login.dart';

abstract class AuthRepo {
  Future<Either<dynamic, Login>> login(SignInRequestRM signInRequestRM);

  Future<Either<dynamic, Register>> register(
      RegistrationRequestRM registrationRequestRM);
}
