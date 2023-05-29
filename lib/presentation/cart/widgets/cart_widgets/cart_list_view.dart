import 'package:ecommerce_task/presentation/cart/bloc/home_cubit.dart';
import 'package:ecommerce_task/presentation/cart/widgets/cart_widgets/product_item.dart';
import 'package:ecommerce_task/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, required this.state}) : super(key: key);
  final CartState state;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    final products = CartCubit.get(context).products;
    return AnimationLimiter(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: products?.length ?? 0,
        itemBuilder: (BuildContext context, int index) =>
            AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 1,
                duration: const Duration(milliseconds: 600),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.productDetailsRoute,
                        arguments: products?[index]);
                  },
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: ProductItem(
                        index: index,
                        state: widget.state,
                      ),
                    ),
                  ),
                )),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
