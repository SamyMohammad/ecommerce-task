part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.passwordErrors,
    this.phoneNumberErrors,
    this.nationalIdErrors,
    this.addressErrors,
    this.emailErrors,
    this.data,
    this.message = '',
    this.submissionStatus = SubmissionStatus.idle,
  });

  final SubmissionStatus submissionStatus;
  final String message;
  final dynamic data;
  final List<String>? phoneNumberErrors;
  final List<String>? passwordErrors;
  final List<String>? emailErrors;
  final List<String>? addressErrors;
  final List<String>? nationalIdErrors;
  String getMessage() => message;

  SubmissionStatus getSubmissionStatus() => submissionStatus;

  RegistrationState copyWith({
    List<String>? phoneNumberErrors,
    List<String>? passwordErrors,
    List<String>? emailErrors,
    List<String>? addressErrors,
    List<String>? nationalIdErrors,
    SubmissionStatus? submissionStatus,
    String? message,
    dynamic data,
  }) {
    return RegistrationState(
        addressErrors: addressErrors ?? this.addressErrors,
        emailErrors: emailErrors ?? this.emailErrors,
        nationalIdErrors: nationalIdErrors ?? this.nationalIdErrors,
        phoneNumberErrors: phoneNumberErrors ?? this.phoneNumberErrors,
        passwordErrors: passwordErrors ?? this.passwordErrors,
        submissionStatus: submissionStatus ?? SubmissionStatus.idle,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        submissionStatus,
        phoneNumberErrors,
        passwordErrors,
        message,
        data,
        nationalIdErrors,
        addressErrors,
        emailErrors,
      ];
}
