import 'package:ecommerce_task/components/default_textfield.dart';
import 'package:ecommerce_task/presentation/search/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/search_cubit.dart';

class SearchContentBody extends StatefulWidget {
  const SearchContentBody({Key? key, required this.state}) : super(key: key);
  final SearchState state;

  @override
  State<SearchContentBody> createState() => _SearchContentBodyState();
}

class _SearchContentBodyState extends State<SearchContentBody> {
  @override
  void initState() {
    super.initState();
    SearchCubit.get(context).getAllProducts();
  }

  // @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        DefaultTextField(
          prefix: Icons.search,
          controller: cubit.editingController,
          labelText: 'Search',
          autocorrect: false,
          isHidden: false,
          hintText: 'Looking for a product',
          textInputType: TextInputType.text,
          onChanged: (value) {
            cubit.getAllProducts(query: value);
          },
          maxLines: 1,
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
            child: ProductsGridView(
          state: widget.state,
        ))
      ],
    );
  }
}
