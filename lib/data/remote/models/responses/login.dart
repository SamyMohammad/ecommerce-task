import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(createToJson: false)
class Login {
  Login({this.token});
  @JsonKey(
    name: 'token',
  )
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  /// Connect the generated [_$LoginToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$LoginToJson(this);
}
