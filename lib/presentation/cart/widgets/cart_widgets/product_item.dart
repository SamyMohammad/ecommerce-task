import 'package:ecommerce_task/app/di.dart';
import 'package:ecommerce_task/data/local/data_sources/product_local_storage.dart';
import 'package:ecommerce_task/presentation/cart/bloc/home_cubit.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.index, required this.state})
      : super(key: key);
  final int index;
  final CartState state;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = CartCubit.get(context).products?[widget.index] ??
        const ProductCMData(
          isFinished: false,
          image:
              'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
          price: 0,
          title: '',
          description: '',
          id: '',
        );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: product.id.toString(),
                child: Image.network(product.image, width: 100, height: 100),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.title.substring(0, 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Price:${product.price.round()} \$ ',
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: 30,
                  color: Colors.red,
                  onPressed: () {
                    instance<AppDatabase>().deleteProductCM(product);
                    CartCubit.get(context).getAllProducts();
                    CartCubit.get(context).getPrice();

                    setState(() {});
                  },
                  icon: Icon(Icons.remove_shopping_cart),
                ),
              )
            ],
          ),
        ],
      ),
    );
    // : const ShimmerWidget.rectangle(height: 120);
  }
}
