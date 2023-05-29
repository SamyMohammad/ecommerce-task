import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../data/local/data_sources/user_secure_storage.dart';
import '../presentation/resources/assets_manager.dart';
import '../presentation/resources/routes_manager.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

final emailRegex = RegExp(
  '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
  '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
  '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
  ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
);

bool isAlreadyRegistered = false;

Future<void> buildShowLoadingDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    // false = user must tap button, true = tap outside dialog
    builder: (BuildContext dialogContext) {
      return Center(
          child: SizedBox(
              height: 220.h,
              width: 220.w,
              child: Lottie.asset(JsonAssets.loading, frameRate: FrameRate.max

                  // LoadingAnimationWidget.(
                  //   color: ColorManager.primary,
                  //   size: 60,
                  //
                  // ),

                  )));
    },
  );
}

String getWebsiteName(String url) {
  RegExp regExp = RegExp(r'(?<=www\.)\w+(?=\.com)');
  Match? match = regExp.firstMatch(url);
  return match?.group(0) ?? '';
}

Future<String> getInitialRoute() async {
  final token = await SecureStorage.readToken();
  print(token);
  if (token == null) {
    return Routes.loginRoute;
  } else {
    return Routes.homeScreenRoute;
  }
}
