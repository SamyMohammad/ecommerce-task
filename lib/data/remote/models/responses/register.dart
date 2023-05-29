import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable(createToJson: false)
class Register {
  Register({
    this.id,
  });
  @JsonKey(
    name: 'id',
  )
  num? id;

  static const fromJson = _$RegisterFromJson;
}
