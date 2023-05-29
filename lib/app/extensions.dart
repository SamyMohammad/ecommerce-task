import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/color_manager.dart';
import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
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

extension JobStatusExtension on String {
  Color get color {
    switch (this) {
      case 'pending':
        return ColorManager.pendingColor;
      case 'accepted':
        return ColorManager.primary;
      case 'refused':
        return ColorManager.refusedColor;
      default:
        return Colors.black;
    }
  }
}
