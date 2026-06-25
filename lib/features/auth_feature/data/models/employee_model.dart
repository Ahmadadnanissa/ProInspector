class EmployeeModel {
  final String id;

  final String email;
  final String role;
  final bool isActive;
  final bool otpVerified;

  EmployeeModel({
    required this.id,

    required this.email,
    required this.role,
    required this.isActive,
    required this.otpVerified,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],

      email: json['email'],
      role: json['role'],
      isActive: json['isActive'],
      otpVerified: json['otpVerified'],
    );
  }
}

class EmployeeProfileModel {
  final String id;
  final String name;
  final String role;
  final String fullName;
  final String? photo;

  EmployeeProfileModel({
    required this.id,
    required this.name,
    required this.role,
    required this.fullName,
    this.photo,
  });

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) {
    return EmployeeProfileModel(
      id: json['employee']['id'],
      name: json['employee']['name'],
      role: json['employee']['role'],
      fullName: json['employee']['fullName'],
      photo: json['employee']['photo'],
    );
  }
}

class AuthResponseModel {
  final String status;
  final String token;
  final EmployeeModel employee;
  final EmployeeProfileModel profile;

  AuthResponseModel({
    required this.status,
    required this.token,
    required this.employee,
    required this.profile,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      token: json['token'],
      employee: EmployeeModel.fromJson(json['data']),
      profile: EmployeeProfileModel.fromJson(json['data']),
    );
  }
}
