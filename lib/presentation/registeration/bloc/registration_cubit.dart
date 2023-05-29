import 'package:ecommerce_task/data/remote/models/requests/registeration_request_rm.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth_repository/auth_repo.dart';
import '../../common/state_renderer/state_renderer.dart';


part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.authRepo) : super(const RegistrationState());
  final AuthRepo authRepo;
  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  init() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();

  }

  dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  void onSubmit(RegistrationRequestRM registrationRequestRM) {
    final newState =
        state.copyWith(submissionStatus: SubmissionStatus.popupLoadingState);

    emit(newState);

    authRepo
        .register(registrationRequestRM)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }
              final newState = state.copyWith(
                submissionStatus: SubmissionStatus.popupErrorState,
                message: l.message,

              );
              emit(newState);
            }, (r) {
              final newState = state.copyWith(
                  submissionStatus: SubmissionStatus.popupSuccess,
                  message: 'signed up successfully ');
              emit(newState);
            }));
  }

  setErrorsToNull() {
    final newState = state.copyWith(
        passwordErrors: null,
        emailErrors: null,
     );

    emit(newState);
  }
}
