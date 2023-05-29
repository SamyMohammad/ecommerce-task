import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/di.dart';
import '../../../app/extensions.dart';
import '../../../components/custom_toast.dart';
import '../bloc/registration_cubit.dart';
import '../widgets/register_screen_content.dart';

class Registration1Screen extends StatefulWidget {
  const Registration1Screen({Key? key, required this.onSignUpSuccess})
      : super(key: key);
  final VoidCallback onSignUpSuccess;
  @override
  State<Registration1Screen> createState() => _Registration1ScreenState();
}

class _Registration1ScreenState extends State<Registration1Screen> {
  FToast? fToast;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
  }

  // void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(instance()),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listenWhen: (oldState, newState) =>
            oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<RegistrationCubit>();
          return BuildBody(
            cubit: cubit,
          );
        },
      ),
    );
  }

  showCustomToast(
      {Color? color,
      String? message,
      IconData? iconData,
      List<String>? phoneNumberErrorsList,
      List<String>? passwordErrorsList,
      List<String>? passwordConfirmationErrorsList,
      List<String>? addressErrorsList,
      List<String>? emailErrorsList,
      List<String>? nationalIdErrorsList,
      ToastGravity? toastGravity}) {
    Widget toast = CustomToast(
      iconData: Icons.error_outline,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
      phoneNumberErrors: buildErrors(phoneNumberErrorsList),
      addressErrors: buildErrors(addressErrorsList),
      emailErrors: buildErrors(emailErrorsList),
      nationalIdErrors: buildErrors(nationalIdErrorsList),
      passwordConfirmationErrors: buildErrors(passwordConfirmationErrorsList),
    );

    FocusManager.instance.primaryFocus?.unfocus();

    fToast?.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 6),
        fadeDuration: const Duration(seconds: 1),
        gravity: toastGravity);
  }
}
