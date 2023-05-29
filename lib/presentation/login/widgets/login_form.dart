import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/default_button.dart';
import '../../../components/default_textfield.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../bloc/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.state, required this.cubit})
      : super(key: key);
  final LoginCubit cubit;
  final LoginState state;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    widget.cubit.init();
    passwordVisible = true;
  }

  @override
  void dispose() {
    widget.cubit.dispose();

    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.state.submissionStatus == SubmissionStatus.inProgress;
    return Column(
      children: [
        DefaultTextField(
          controller: widget.cubit.userNameController,
          textInputAction: TextInputAction.next,
          labelText: AppStrings.userName,
          autocorrect: false,
          isHidden: false,
          hintText: AppStrings.userName,
          textInputType: TextInputType.text,
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
            suffix: passwordVisible ? Icons.visibility_off : Icons.visibility,
            suffixPressed: () {
              setState(() => passwordVisible = !passwordVisible);
            },
            controller: widget.cubit.passwordController,
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
        buildForgetPassword(context),
        SizedBox(height: 30.h),
        CustomButton(
          onTap: () {
            widget.cubit.onSubmit();
          },
          buttonText: AppStrings.signIn,
          height: 45.h,
          buttonColor: ColorManager.primary,
          textColor: Colors.white,
        ),
        SizedBox(height: 30.h),
        buildOrRow(),
        SizedBox(height: 30.h),
        CustomButton(
          onTap: () {
            widget.cubit.setDataToNull();
            Navigator.of(context).pushNamed(Routes.register1Route);
          },
          buttonText: AppStrings.createAccount,
          height: 45.h,
          buttonColor: ColorManager.primary,
          textColor: Colors.white,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }

  Row buildForgetPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Text(AppStrings.forgetPassword,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeightManager.regular,
                  fontFamily: FontConstants.fontFamily,
                  color: ColorManager.forgetPassword)),
        ),
      ],
    );
  }

  Padding buildOrRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 1.h,
              color: const Color(0xff677674),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10), child: Text('Or')),
          Expanded(
            child: Container(
              height: 1.h,
              color: const Color(0xff677674),
            ),
          ),
        ],
      ),
    );
  }
}
