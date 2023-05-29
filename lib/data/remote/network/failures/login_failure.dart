
/// status_code : 422
/// message : "Validation error"
/// data : {"phone_number":["The phone number format is invalid."],"password":["The password must be a string.","The password must be at least 8 characters."]}
class Failure {
  Failure({
      this.statusCode, 
      this.message, 
      this.errors,});

  Failure.fromJson(dynamic json) {
    statusCode = json['status_code'];
    message = json['message'];
    errors = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? statusCode;
  String? message;
  Data? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['message'] = message;
    if (errors != null) {
      map['data'] = errors?.toJson();
    }
    return map;
  }

}
class Data {
  Data({
    this.phoneNumber,
    this.password,
    this.nationalId,
    this.email,
    this.address,
    this.university,
    this.faculty,
    this.courses,
    this.certificates,
    this.martialStatus,
    this.specialization,
    this.level,
  });
  List<String>? nationalId;
  List<String>? email;
  List<String>? password;
  List<String>? phoneNumber;
  List<String>? address;
  List<String>? university;
  List<String>? faculty;
  List<String>? courses;
  List<String>? certificates;
  List<String>? martialStatus;
  List<String>? specialization;
  List<String>? level;
  Data.fromJson(dynamic json) {
    nationalId = json['national_id'] != null ? json['national_id'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    password = json['password'] != null ? json['password'].cast<String>() : [];
    phoneNumber = json['phone_number'] != null ? json['phone_number'].cast<String>() : [];
    address = json['address'] != null ? json['address'].cast<String>() : [];
    university = json['university'] != null ? json['university'].cast<String>() : [];
    faculty = json['faculty'] != null ? json['faculty'].cast<String>() : [];
    courses = json['courses'] != null ? json['courses'].cast<String>() : [];
    certificates = json['certificates'] != null ? json['certificates'].cast<String>() : [];
    martialStatus = json['martial_status'] != null ? json['martial_status'].cast<String>() : [];
    specialization = json['specialization'] != null ? json['specialization'].cast<String>() : [];
    level = json['level'] != null ? json['level'].cast<String>() : [];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['national_id'] = nationalId;
    map['email'] = email;
    map['password'] = password;
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['university'] = university;
    map['faculty'] = faculty;
    map['courses'] = courses;
    map['certificates'] = certificates;
    map['martial_status'] = martialStatus;
    map['specialization'] = specialization;
    map['level'] = level;
    return map;
  }

}