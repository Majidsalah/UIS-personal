import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uis_attendance/core/api/service_locator_setup.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/features/auth/user_data/data/models/user_details_model.dart';
import 'package:uis_attendance/features/auth/user_data/data/user_repo/user_repo_impl.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());

  var userRepository = getIt.get<UserRepositoryImpl>();
  TextEditingController idNumber = TextEditingController();

  Future<void> getUserDetails() async {
    emit(UserDetailsLoading());
    var userdetails = await userRepository.getUserDetailes(idNumber.text);
    ShPref.saveNationalId(idNumber.text);
    log(ShPref.getNationalId());

    userdetails.fold(
      (failure) => emit(UserDetailsFailure()),
      (userInfo) => emit(UserDetailsSucess(user: userInfo)),
    );
  }
}
