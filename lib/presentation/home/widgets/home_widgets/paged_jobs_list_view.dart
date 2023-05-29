import 'package:ecommerce_task/presentation/home/bloc/home_cubit.dart';
import 'package:ecommerce_task/presentation/home/widgets/home_widgets/product_item.dart';
import 'package:ecommerce_task/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    final products = HomeCubit.get(context).products;
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
                duration: const Duration(milliseconds: 1500),
                // delay: const Duration(milliseconds: 700),
                child: InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed(Routes.productDetailsRoute,
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
      ),
    );
  }
}
