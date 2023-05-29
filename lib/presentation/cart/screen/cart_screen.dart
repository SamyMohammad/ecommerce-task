import 'package:ecommerce_task/presentation/cart/widgets/cart_widgets/cart_content_body.dart';
import 'package:ecommerce_task/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/di.dart';
import '../bloc/home_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<CartCubit>()
        ..getAllProducts()
        ..getPrice(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Cart',
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20)),
                centerTitle: false,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: CartContentBody(state: state),
              ));
        },
      ),
    );
  }
}
