class HistoryModel {
  int? logId;
  String? code;
  String? time;
  int? companyId;
  int? employeeId;

  HistoryModel({
    this.logId,
    this.code,
    this.time,
    this.companyId,
    this.employeeId,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        logId: json['logId'],
        code: json['code'],
        time: json['time'],
        companyId: json['companyId'],
        employeeId: json['employeeId'],
      );

  // Map<String, dynamic> toJson() => {
  //       'logId': logId,
  //       'code': code,
  //       'time': time?.toIso8601String(),
  //       'companyId': companyId,
  //       'employeeId': employeeId,
  //     };
}
