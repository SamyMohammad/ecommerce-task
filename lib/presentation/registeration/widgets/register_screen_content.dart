import 'package:ecommerce_task/components/default_button.dart';
import 'package:ecommerce_task/components/default_textfield.dart';
import 'package:ecommerce_task/data/remote/models/requests/registeration_request_rm.dart';
import 'package:ecommerce_task/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../bloc/registration_cubit.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key, required this.cubit}) : super(key: key);
  final RegistrationCubit cubit;

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final _formKey = GlobalKey<FormState>();
  late bool passwordVisible;
  late bool passwordConfirmVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordConfirmVisible = true;

    // Subscribe
    widget.cubit.init();
  }

  @override
  void dispose() {
    super.dispose();
    widget.cubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: [0.3, 0.5, 0.9],
              colors: [Color(0xFFC8D3FF), Color(0xFFD7DDFF), Color(0xFFECEAFF)],
            )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/695.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                            color: ColorManager.dark)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DefaultTextField(
                    textInputAction: TextInputAction.next,
                    labelText: AppStrings.userName,
                    autocorrect: false,
                    isHidden: false,
                    hintText: AppStrings.userName,
                    textInputType: TextInputType.phone,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'your user name can\'t be empty.';
                      }
                      return null;
                    },
                  ),
                  DefaultTextField(
                    textInputAction: TextInputAction.next,
                    labelText: AppStrings.email,
                    autocorrect: false,
                    isHidden: false,
                    hintText: AppStrings.userName,
                    textInputType: TextInputType.phone,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'your user name can\'t be empty.';
                      }
                      return null;
                    },
                  ),
                  StatefulBuilder(builder: (context, StateSetter setState) {
                    return DefaultTextField(
                      textInputAction: TextInputAction.none,
                      autocorrect: false,
                      labelText: AppStrings.password,
                      isHidden: passwordVisible,
                      suffix: passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      suffixPressed: () {
                        setState(() => passwordVisible = !passwordVisible);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'your password can\'t be empty.';
                        }
                        return null;
                      },
                      hintText: AppStrings.password,
                      maxLines: 1,
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () {},
                    buttonText: 'Register',
                    height: 45.h,
                    buttonColor: ColorManager.primary,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onRegisterSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.cubit.onSubmit(RegistrationRequestRM(
        email: widget.cubit.emailController.text,
        password: widget.cubit.passwordController.text,
        username: widget.cubit.userNameController.text,
      ));
    }
  }
}
