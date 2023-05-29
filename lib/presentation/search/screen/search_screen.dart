import 'package:ecommerce_task/presentation/resources/assets_manager.dart';
import 'package:ecommerce_task/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/di.dart';
import '../../../components/default_button.dart';
import '../bloc/search_cubit.dart';
import '../widgets/search_content_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<SearchCubit>(),
      child: BlocConsumer<SearchCubit, SearchState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = SearchCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Search',
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20)),
                actions: [
                  BlocProvider.value(
                    value: BlocProvider.of<SearchCubit>(context),
                    child: BuildBottomSheet(bloc: bloc),
                  )
                ],
                backgroundColor: Theme.of(context).primaryColor,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: SearchContentBody(state: state),
              ));
        },
      ),
    );
  }
}

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.bloc,
  });

  final SearchCubit bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text('Filters',
                            style: getSemiBoldStyle(
                                color: Colors.black, fontSize: 25)),
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        height: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Sort',
                          style: getSemiBoldStyle(
                              color: Colors.black, fontSize: 25)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: BuildSegmentedButton(bloc: bloc),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Limit',
                          style: getSemiBoldStyle(
                              color: Colors.black, fontSize: 25)),
                      const SizedBox(
                        height: 10,
                      ),
                      BuildLimitSlider(bloc: bloc),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CustomButton(
                          onTap: () {
                            Navigator.of(context).pop();
                            bloc.getAllProducts();
                          },
                          buttonText: 'apply filter',
                          borderRadius: 30,
                          buttonColor: Theme.of(context).primaryColor,
                          width: 200,
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        child: Image.asset(
          ImageAssets.filterIcon,
          color: Colors.white,
        ));
  }
}

class BuildLimitSlider extends StatelessWidget {
  const BuildLimitSlider({
    super.key,
    required this.bloc,
  });

  final SearchCubit bloc;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Slider(
        value: bloc.limit?.toDouble() ?? 0,
        max: 20,
        min: 0,
        divisions: 4,
        onChanged: (value) {
          setState(() {
            bloc.limit = value.toInt();
          });
        },
        label: '${bloc.limit}',
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Colors.black26.withOpacity(.5)),
        activeColor: const Color.fromARGB(255, 160, 161, 173),
        inactiveColor: const Color.fromARGB(255, 88, 89, 104),
        thumbColor: Theme.of(context).primaryColor,
      );
    });
  }
}

class BuildSegmentedButton extends StatelessWidget {
  const BuildSegmentedButton({
    super.key,
    required this.bloc,
  });

  final SearchCubit bloc;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SegmentedButton(
        showSelectedIcon: true,
        style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) => 5),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).primaryColor;
                }
                return Colors.white;
              },
            ),
            iconColor: MaterialStateProperty.all(Colors.white)),
        segments: <ButtonSegment<String>>[
          ButtonSegment<String>(
              value: 'desc',
              label: Text('desc',
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 20)),
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.black,
              )),
          ButtonSegment<String>(
              value: 'asc',
              label: Text(
                'asc',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 20),
              ),
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.black,
              )),
        ],
        selected: <String>{bloc.sort ?? 'desc'},
        onSelectionChanged: (Set<String> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            bloc.sort = newSelection.first;
          });
        },
      );
    });
  }
}
