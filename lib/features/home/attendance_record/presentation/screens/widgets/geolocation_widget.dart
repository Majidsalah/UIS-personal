import 'package:geolocator/geolocator.dart';

Future<void> sendLocationData(int employeeId) async {
  Position position = await Geolocator.getCurrentPosition();

  // ignore: unused_local_variable
  List<Map<String, dynamic>> locationData = [
    {
      "id": 0,
      "langitude": position.longitude,
      "latitude": position.latitude,
      "date": DateTime.now().toIso8601String(),
      "employeeId": employeeId,
    },
    {
      "id": 0,
      "langitude": position.longitude,
      "latitude": position.latitude,
      "date": DateTime.now().add(Duration(minutes: 1)).toIso8601String(),
      "employeeId": employeeId,
    },
    {
      "id": 0,
      "langitude": position.longitude,
      "latitude": position.latitude,
      "date": DateTime.now().add(Duration(minutes: 2)).toIso8601String(),
      "employeeId": employeeId,
    },
  ];
}
