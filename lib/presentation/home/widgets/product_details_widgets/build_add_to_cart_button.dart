import 'package:drift/drift.dart';
import 'package:ecommerce_task/app/di.dart';
import 'package:ecommerce_task/components/default_button.dart';
import 'package:ecommerce_task/data/local/data_sources/product_local_storage.dart';
import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

CustomButton buildCustomButton(
    BuildContext context, GetProductResponse product) {
  return CustomButton(
    onTap: () async {
      instance<AppDatabase>().insertProductCM(ProductCMCompanion(
          id: Value(Uuid().v1()),
          title: Value(product.title ?? ''),
          price: Value(product.price ?? 0),
          description: Value(product.description ?? ''),
          image: Value(product.image ?? ''),
          isFinished: const Value(false)));
      var list = await instance<AppDatabase>().getALlProductCM();
      print(list.length);
    },
    buttonText: 'Add To Cart',
    width: 300,
    borderRadius: 30,
    buttonColor: Theme.of(context).primaryColor,
  );
}
