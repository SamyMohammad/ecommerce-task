import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(createToJson: false)
class GetProductResponse {
  GetProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory GetProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
