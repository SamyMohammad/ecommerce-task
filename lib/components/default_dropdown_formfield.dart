import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/color_manager.dart';
import '../presentation/resources/font_manager.dart';
import 'controller.dart';

class CustomDropDownMenuFormField extends StatelessWidget {
  const CustomDropDownMenuFormField(
      {Key? key,
      required this.items,
      this.onChanged,
      this.controller,
      required this.value,
      this.id,
      this.hint,
      this.validator,
      this.labelText})
      : super(key: key);
  final List items;
  final int? id;
  final dynamic value;
  final String? labelText;
  final ChangerController? controller;
  final void Function(dynamic)? onChanged;
  final String? hint;
  final String? Function(dynamic value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   top: 5.h,
      // ),
      // decoration: BoxDecoration(
      //     border: Border.all(),
      //     borderRadius: BorderRadius.all(Radius.circular(5.sp))),
      // height: 40.h,
      // width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField(
        isExpanded: true,

        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.sp)),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: ColorManager.boxBorder)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.sp)),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: ColorManager.boxBorder)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.sp)),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: ColorManager.boxBorder)),

          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.sp)),
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.black)),
          // border: Border.all(),
        ),
        validator: validator,
        iconEnabledColor: Colors.black,

        hint: Text(
          hint ?? '',
          style: TextStyle(
              color: ColorManager.hintText,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: FontConstants.fontFamily),
          overflow: TextOverflow.ellipsis,
        ),
        // borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
        // isExpanded: true,
        // underline: Container(
        //   height: 0,
        // ),
        iconSize: 24,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(5.sp),
        items: items
            .map((item) => DropdownMenuItem<dynamic>(
                  value: item,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      item.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1,
                        fontFamily: FontConstants.fontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
