import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants.dart';
import '../../../data/local/data_sources/user_secure_storage.dart';
import '../../../data/remote/models/requests/sign_in_request_rm.dart';
import '../../../data/repositories/auth_repository/auth_repo.dart';
import '../../common/state_renderer/state_renderer.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepo,
  }) : super(
          const LoginState(),
        );

  final AuthRepo authRepo;

  late TextEditingController userNameController;
  late TextEditingController passwordController;
  init() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  dispose() {
    userNameController.dispose();
    passwordController.dispose();
  }

  void onSubmit() {
    final newState = state.copyWith(
        phoneNumber: userNameController.text,
        password: passwordController.text,
        submissionStatus: SubmissionStatus.popupLoadingState);

    emit(newState);

    authRepo
        .login(
          SignInRequestRM(
              phoneNumber: userNameController.text,
              password: passwordController.text),
        )
        .then((value) => value.fold((l) {
              print(l);
              final newState = state.copyWith(
                submissionStatus: SubmissionStatus.popupErrorState,
                message: l,
                // passwordErrors: l.errors?.password ?? [],
                // phoneNumberErrors: l.errors?.phoneNumber ?? [],
              );
              emit(newState);
            }, (r) async {
              await SecureStorage.writeToken(
                value: r.token ?? '',
              );
              print('____');
              // var token =await UserSecureStorage.getUserToken();
              // print(token);
              print(r.token ?? '');
              final newState = state.copyWith(
                  submissionStatus: SubmissionStatus.popupSuccess,
                  message: 'signed in successfully');
              emit(newState);
            }));
  }

  setErrorsToNull() {
    final newState =
        state.copyWith(passwordErrors: null, phoneNumberErrors: null);

    emit(newState);
  }

  setDataToNull() {
    final newState = state.copyWith(
      phoneNumber: '',
      password: '',
    );

    emit(newState);
  }
}
