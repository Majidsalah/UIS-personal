class LoginEmployeeModel {
  String? employeeName;
  String? token;
  LoginEmployeeModel({
    this.employeeName,
    this.token,
  });

  factory LoginEmployeeModel.fromJson(Map<String, dynamic> json) =>
      LoginEmployeeModel(
        employeeName: json['employeeName'] as String?,
        token: json['token'] as String?,
      );
}
