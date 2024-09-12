class EndPoints {
  static const String baseUrl =
      'http://18.224.175.116/UISAttendanceMobile/api/';
  static const String getUserDetails = '${baseUrl}Employee/FindHREmployee';
  static const String loginEmployee = '${baseUrl}Employee/LoginEmployee?';
  static const String setNewPin = '${baseUrl}Employee/ChangePin?';
  static const String attendanceRecord =
      '${baseUrl}Attendance/SaveAttendanceLog?';
}

class ApiKeys {
  static String idNumber = "nationalId";
  static String token = "token";
  static String pinNumber = "Pin";
  static String time = "time";
  static String companyName = "companyName";
}
