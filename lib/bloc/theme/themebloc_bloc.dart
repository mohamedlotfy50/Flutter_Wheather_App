import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/bloc/theme/app_theme.dart';
import 'package:weather/utils/shared_prefferances.dart';

part 'themebloc_event.dart';
part 'themebloc_state.dart';

class ThemeBloc extends Bloc<ThemeblocEvent, ThemeState> {
  @override
  ThemeState get initialState => Constant.preferences.getBool('IsDark')
      ? ThemeState(themeData: appThemesData[Themes.darkTheme])
      : ThemeState(themeData: appThemesData[Themes.brightTheme]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeblocEvent event,
  ) async* {
    if (event is ChangeThemeEvent) {
      yield ThemeState(themeData: appThemesData[event.appTheme]);
    }
  }
}
