class UserDetailsModel {
  String? employeeName;
  dynamic employeeNameEn;
  int? employeeId;
  String? department;
  String? companyName;
  bool? isRegistered;
  bool? isMale;

  UserDetailsModel({
    this.employeeName,
    this.employeeNameEn,
    this.employeeId,
    this.department,
    this.companyName,
    this.isRegistered,
    this.isMale,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      employeeName: json['employeeName'] as String?,
      department: json['department'] as String?,
      companyName: json['companyName'] as String?,
    );
  }
}
