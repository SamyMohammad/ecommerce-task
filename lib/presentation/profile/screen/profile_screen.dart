import 'package:ecommerce_task/presentation/profile/screen/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/di.dart';
import '../../../components/custom_toast.dart';
import '../../../data/local/data_sources/user_secure_storage.dart';
import '../bloc/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  void logout() async {
    // Perform an async operation, such as calling an API
    // and waiting for a response
    await SecureStorage.delete();

    // Call the callback function with the message
    // onDelete(message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(instance()),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) async {},
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          return SafeArea(
            child: Scaffold(
              extendBody: true,
              backgroundColor: const Color(0xffeef1ff),
              body: ProfileContentBody(cubit: cubit, state: state),
            ),
          );
        },
      ),
    );
  }

  List<Padding>? buildErrors(List<String>? errorsList) {
    return errorsList
        ?.map(
          (e) => Padding(
            padding: EdgeInsets.only(bottom: 8.0.h, right: 10.w, left: 10.w),
            child: Text(
              '-$e',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
          ),
        )
        .toList();
  }

  showCustomToast(
      {Color? color,
      String? message,
      IconData? iconData,
      List<String>? passwordErrorsList,
      ToastGravity? toastGravity}) {
    Widget toast = CustomToast(
      iconData: Icons.error_outline,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
    );

    FocusManager.instance.primaryFocus?.unfocus();

    fToast?.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 6),
        fadeDuration: const Duration(seconds: 1),
        gravity: toastGravity);
  }
}
