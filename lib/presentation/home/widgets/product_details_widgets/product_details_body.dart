import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:ecommerce_task/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import 'build_add_to_cart_button.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({Key? key, required this.product}) : super(key: key);
  final GetProductResponse product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Hero(
            transitionOnUserGestures: true,
            tag: product.image.toString(),
            child: Image.network('${product.image}', width: 300, height: 300),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${product.title}\$',
          style:
              getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 25),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${product.price}\$',
          style:
              getBoldStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${product.description}',
          style: getBoldStyle(color: Colors.black45, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: buildCustomButton(context, product),
        )
      ],
    );
  }
}
