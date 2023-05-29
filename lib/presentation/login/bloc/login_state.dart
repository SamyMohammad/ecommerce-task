part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.passwordErrors,
    this.phoneNumberErrors,
    this.data,
    this.message = '',
    this.phoneNumber = '',
    this.password = '',
    this.submissionStatus = SubmissionStatus.idle,
  });

  final String phoneNumber;
  final String password;
  final SubmissionStatus submissionStatus;
  final String message;
  final dynamic data;
  final List<String>? phoneNumberErrors;
  final List<String>? passwordErrors;
  String getMessage() => message;

  SubmissionStatus getSubmissionStatus() => submissionStatus;

  LoginState copyWith({
    String ?phoneNumber,
    String? password,
    List<String>? phoneNumberErrors,
    List<String>? passwordErrors,
    SubmissionStatus? submissionStatus,
    String? message,
    dynamic data,
  }) {
    return LoginState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        phoneNumberErrors: phoneNumberErrors ?? this.phoneNumberErrors,
        passwordErrors: passwordErrors ?? this.passwordErrors,
        submissionStatus: submissionStatus ?? SubmissionStatus.idle,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        submissionStatus,
        phoneNumberErrors,
        passwordErrors,
        message,
        data
      ];
}

extension LoginStateExtension on LoginState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (submissionStatus) {
      case SubmissionStatus.popupLoadingState:
        // show popup loading
        showPopup(context, getSubmissionStatus(), message);
        // show content ui of the screen
        return contentScreenWidget;

      case SubmissionStatus.fullScreenLoadingState:
        // full screen loading state
        return StateRenderer(
          message: message,
          retryActionFunction: retryActionFunction,
          submissionStatus: getSubmissionStatus(),
        );

      case SubmissionStatus.popupErrorState:
        // dismissDialog(context);
        // // show popup error
        // showPopup(context, SubmissionStatus.popupErrorState, message);
        // show content ui of the screen
        return contentScreenWidget;

      case SubmissionStatus.fullScreenErrorState:
        // full screen loading state
        return StateRenderer(
          message: message,
          retryActionFunction: retryActionFunction,
          submissionStatus: SubmissionStatus.fullScreenErrorState,
        );

      case SubmissionStatus.fullScreenEmptyState:
        // full screen loading state
        return StateRenderer(
            message: message,
            submissionStatus: SubmissionStatus.fullScreenEmptyState,
            retryActionFunction: retryActionFunction);

      case SubmissionStatus.contentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case SubmissionStatus.popupSuccess:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          // dismissDialog(context);

          // // show popup
          // showPopup(context, SubmissionStatus.popupSuccess, message,
          //     title: AppStrings.success);
          // return content ui of the screen
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(
      BuildContext context, SubmissionStatus submissionStatus, String message,
      {String title = Constants.empty}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
            submissionStatus: submissionStatus,
            message: message,
            title: title,
            retryActionFunction: () {})));
  }
}
