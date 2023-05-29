import 'package:ecommerce_task/presentation/home/widgets/home_widgets/paged_jobs_list_view.dart';
import 'package:ecommerce_task/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../bloc/home_cubit.dart';

class HomeContentBody extends StatefulWidget {
  const HomeContentBody({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAllProducts();
  }

  // @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
        ),
        if (widget.state is GetAllProductsSuccessState)
          Expanded(
              child: ProductsGridView(
            state: widget.state,
          )),
        if (widget.state is GetAllProductsLoadingState)
          Center(
            child: Lottie.asset(
              JsonAssets.loading,
              height: 250,
              width: 250,
            ),
          )
      ],
    );
  }
}
