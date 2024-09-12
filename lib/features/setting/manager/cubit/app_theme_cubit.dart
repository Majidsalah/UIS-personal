import 'package:bloc/bloc.dart';
import 'package:uis_attendance/core/cache_helper/shared_prefrences.dart';
import 'package:uis_attendance/core/utils/app_theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.intial:
        if (ShPref.getTheme() != null) {
          if (ShPref.getTheme() == 'light') {
            emit(AppThemeLight());
          } else {
            emit(AppThemeDark());
          }
        }

        break;
      case ThemeState.light:
        ShPref.setTheme('light');
        emit(AppThemeLight());
        break;
      case ThemeState.dark:
        ShPref.setTheme('dark');
        emit(AppThemeDark());
        break;
      default:
    }
  }
}
