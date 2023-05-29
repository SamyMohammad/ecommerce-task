import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:flutter/material.dart';

import '../bloc/search_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.index, required this.state})
      : super(key: key);
  final int index;
  final SearchState state;

  @override
  Widget build(BuildContext context) {
    final product =
        SearchCubit.get(context).products?[index] ?? GetProductResponse();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage('${product.image}'),
            width: 160,
            height: 160,
          ),
          Text(
            product.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Price:${product.price!.round()} \$ ',
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    // ShopCubit.get(context)
                    //     .changeFavourites(product.id);
                    // print(product.inFavorites);
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                    // backgroundColor: ShopCubit.get(context).favourites[product.id] == true  ? Colors.red :Colors.grey,
                    child: Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
    // : const ShimmerWidget.rectangle(height: 120);
  }
}
