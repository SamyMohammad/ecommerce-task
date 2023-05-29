import 'package:ecommerce_task/app/di.dart';
import 'package:ecommerce_task/data/remote/models/responses/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/styles_manager.dart';
import '../bloc/home_cubit.dart';
import '../widgets/product_details_widgets/product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as GetProductResponse?;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Product Details',
              style: getSemiBoldStyle(color: Colors.white, fontSize: 20)),
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocProvider(
          create: (context) => instance<HomeCubit>(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: ProductDetailsBody(
                      product: product ?? GetProductResponse(),
                    )),
              );
            },
          ),
        ));
  }
}
