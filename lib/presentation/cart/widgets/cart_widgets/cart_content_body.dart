import 'package:ecommerce_task/presentation/cart/widgets/cart_widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/home_cubit.dart';

class CartContentBody extends StatefulWidget {
  const CartContentBody({Key? key, required this.state}) : super(key: key);
  final CartState state;

  @override
  State<CartContentBody> createState() => _CartContentBodyState();
}

class _CartContentBodyState extends State<CartContentBody> {
  @override
  void initState() {
    super.initState();

    // Future.wait([CartCubit.get(context).getPrice()]);
  }

  // @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        if (widget.state is GetProductsState)
          Expanded(
              child: ProductsGridView(
            state: widget.state,
          )),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          padding: const EdgeInsets.all(20),
          height: 100,
          alignment: Alignment.center,
          width: double.maxFinite,
          child: Text(
            'All price : ${CartCubit.get(context).allPrice.toInt()} ',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
