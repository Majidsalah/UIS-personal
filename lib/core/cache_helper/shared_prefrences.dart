import 'package:shared_preferences/shared_preferences.dart';

class ShPref {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveAccessToken(String accessToken) {
    sharedPreferences.setString("token", accessToken);
  }

  static saveNationalId(String idNumber) {
    sharedPreferences.setString("nationalId", idNumber);
  }

  static saveUserName(String userName) {
    sharedPreferences.setString("employeeName", userName);
  }

  static saveCompanyName(String companyName) {
    sharedPreferences.setString("companyName", companyName);
  }

  static setTheme(String theme) {
    sharedPreferences.setString("theme", theme);
  }

  static setLang(String lang) {
    sharedPreferences.setString("Lang", lang);
  }

  static getAccessToken() {
    return sharedPreferences.getString("token");
  }

  static getNationalId() {
    return sharedPreferences.getString("nationalId");
  }

  static getUserName() {
    return sharedPreferences.getString("employeeName");
  }

  static getCompanyName() {
    return sharedPreferences.getString("companyName");
  }

  static getTheme() {
    return sharedPreferences.getString("theme");
  }

  static getLang() {
    return sharedPreferences.getString("Lang");
  }

  static clearAllData() {
    return sharedPreferences.clear();
  }
}
