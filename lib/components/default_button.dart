import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/styles_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.width,
    this.isMore,
    this.height,
    this.imgPath,
    this.onTap,
    this.borderRadius,
    this.buttonColor = Colors.green,
    this.textColor = Colors.white,
    this.borderColor,
    required this.buttonText,
    this.icon,
    this.isDialog,
    this.paddingHorizontal,
    this.paddingVertical,
    Key? key,
  }) : super(key: key);

  VoidCallback? onTap;

  Color? buttonColor;

  double? borderRadius;
  bool? isDialog;
  bool? isMore;

  Color? textColor;

  String? buttonText;

  Color? borderColor;
  final Widget? icon;
  double? paddingVertical;
  double? paddingHorizontal;
  String? imgPath;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.h,
      width: width ?? MediaQuery.of(context).size.width,
      // margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          // color: buttonColor ?? Colors.white,
          border: Border.all(
              color: borderColor ?? buttonColor ?? Colors.transparent),
          borderRadius:
              BorderRadius.all(Radius.circular(borderRadius ?? 10.sp))),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                vertical: paddingVertical ?? 13.h,
                horizontal: paddingHorizontal ?? 40.w)),
            visualDensity: VisualDensity.comfortable,
            backgroundColor:
                MaterialStatePropertyAll(buttonColor ?? Colors.green),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 10.sp)),
                side: BorderSide(
                  width: 0,
                  color: buttonColor ?? Colors.black54,
                ),
              ),
            )),
        onPressed: onTap,
        child: Text(
          buttonText!,
          style: (isDialog == true)
              ? getRegularStyle(
                  color: textColor ?? Colors.white, fontSize: 13.sp)
              : (isMore == true)
                  ? getBoldStyle(
                      color: textColor ?? Colors.white, fontSize: 13.sp)
                  : getBoldStyle(
                      color: textColor ?? Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }
}
