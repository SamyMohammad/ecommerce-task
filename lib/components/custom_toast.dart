import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToast extends StatelessWidget {
  const CustomToast(
      {Key? key,
      this.color,
      this.iconData,
      this.message,
      this.phoneNumberErrors,
      this.passwordErrors,
      this.emailErrors,
      this.nationalIdErrors,
      this.firstNameErrors,
      this.middleNameErrors,
      this.lastNameErrors,
      this.addressErrors,
      this.passwordConfirmationErrors})
      : super(key: key);
  final Color? color;
  final IconData? iconData;
  final String? message;
  final List<Widget>? phoneNumberErrors;
  final List<Widget>? emailErrors;
  final List<Widget>? nationalIdErrors;
  final List<Widget>? passwordErrors;
  final List<Widget>? firstNameErrors;
  final List<Widget>? middleNameErrors;
  final List<Widget>? lastNameErrors;
  final List<Widget>? addressErrors;
  final List<Widget>? passwordConfirmationErrors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.sp),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                iconData,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          ...?phoneNumberErrors,
          ...?passwordErrors,
          ...?emailErrors,
          ...?firstNameErrors,
          ...?middleNameErrors,
          ...?lastNameErrors,
          ...?addressErrors,
          ...?nationalIdErrors,
          ...?passwordConfirmationErrors,
        ],
      ),
    );
  }
}
