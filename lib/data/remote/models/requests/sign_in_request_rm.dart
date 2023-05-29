import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class SignInRequestRM {
  const SignInRequestRM({
    required this.phoneNumber,
    required this.password,
  });

  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$SignInRequestRMToJson(this);
}
