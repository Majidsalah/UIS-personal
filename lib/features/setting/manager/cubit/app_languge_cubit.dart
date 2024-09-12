import 'package:bloc/bloc.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_lang_state.dart';

part 'app_languge_state.dart';

class AppLangugeCubit extends Cubit<AppLangugeState> {
  AppLangugeCubit() : super(AppLangugeInitial());
  appCurrentLang(AppLangState lang) {
    switch (lang) {
      case AppLangState.intial:
        if (ShPref.getLang() != null) {
          if (ShPref.getLang() == 'ar') {
            emit(AppLangugeAr());
          } else {
            emit(AppLangEn());
          }
        }

        break;
      case AppLangState.en:
        ShPref.setLang('en');
        emit(AppLangEn());
        break;
      case AppLangState.ar:
        ShPref.setLang('ar');
        emit(AppLangugeAr());
        break;
      default:
    }
  }
}
