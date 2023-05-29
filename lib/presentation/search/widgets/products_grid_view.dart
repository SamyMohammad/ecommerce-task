import 'package:ecommerce_task/presentation/search/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../bloc/search_cubit.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, required this.state}) : super(key: key);
  final SearchState state;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    final products = SearchCubit.get(context).products;
    return AnimationLimiter(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .55,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) =>
            AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 2,
          duration: const Duration(milliseconds: 1400),
          child: SlideAnimation(
            child: FadeInAnimation(
              child: ProductItem(
                index: index,
                state: widget.state,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
