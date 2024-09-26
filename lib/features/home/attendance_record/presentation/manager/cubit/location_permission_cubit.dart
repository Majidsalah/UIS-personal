import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit() : super(LocationPermissionInitial());

  Future<Position> determinePosition() async {
    bool serviceEnabled;

    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(LocationServiceDisabled());
      await Geolocator.requestPermission();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationPermissionDenied());
        return Future.error('Location permission denied 1!!');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(LocationPermissionDeniesForever());
      return Future.error('Location permission denied!2!');
    }
    position = await Geolocator.getCurrentPosition();
    emit(LocationPermissionAccepted(position: position));
    log("$position");
    return position;
  }
}

void closeApp() {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(0);
  }
}
