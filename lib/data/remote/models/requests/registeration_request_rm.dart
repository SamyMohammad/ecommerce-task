import 'package:json_annotation/json_annotation.dart';

part 'registeration_request_rm.g.dart';

@JsonSerializable(createFactory: false)
class RegistrationRequestRM {
  const RegistrationRequestRM({
    required this.password,
    required this.username,
    required this.email,
  });

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$RegistrationRequestRMToJson(this);
}
