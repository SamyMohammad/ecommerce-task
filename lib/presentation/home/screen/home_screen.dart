import 'package:ecommerce_task/presentation/resources/routes_manager.dart';
import 'package:ecommerce_task/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/di.dart';
import '../bloc/home_cubit.dart';
import '../widgets/home_widgets/home_content_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Fake Store',
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20)),
                centerTitle: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.searchRoute);
                      },
                      icon: const Icon(Icons.search)),
                ],
                backgroundColor: Theme.of(context).primaryColor,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: HomeContentBody(state: state),
              ));
        },
      ),
    );
  }
}
