/// status_code : 422
/// message : "Validation error"
/// data : {"national_id":["The national id field is required."],"email":["The email field is required."],"password":["The password must be a string.","The password must be at least 8 characters."],"phone_number":["The phone number field is required."],"address":["The address field is required."],"university":["The university field is required."],"faculty":["The faculty field is required."],"courses":["The courses field is required."],"certificates":["The certificates field is required."],"martial_status":["The martial status field is required."],"specialization":["The specialization field is required."],"level":["The level field is required."]}

class RegistrationFailure {
  RegistrationFailure({
      this.statusCode, 
      this.message, 
      this.data,});

  RegistrationFailure.fromJson(dynamic json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? statusCode;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// national_id : ["The national id field is required."]
/// email : ["The email field is required."]
/// password : ["The password must be a string.","The password must be at least 8 characters."]
/// phone_number : ["The phone number field is required."]
/// address : ["The address field is required."]
/// university : ["The university field is required."]
/// faculty : ["The faculty field is required."]
/// courses : ["The courses field is required."]
/// certificates : ["The certificates field is required."]
/// martial_status : ["The martial status field is required."]
/// specialization : ["The specialization field is required."]
/// level : ["The level field is required."]

class Data {
  Data({
      this.nationalId, 
      this.email, 
      this.password, 
      this.phoneNumber, 
      this.address, 
      this.university, 
      this.faculty, 
      this.courses, 
      this.certificates, 
      this.martialStatus, 
      this.specialization, 
      this.level,
  });

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