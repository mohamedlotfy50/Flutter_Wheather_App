part of 'themebloc_bloc.dart';

abstract class ThemeblocEvent extends Equatable {
  const ThemeblocEvent([List props = const []]);
}

class ChangeThemeEvent extends ThemeblocEvent {
  final Themes appTheme;

  ChangeThemeEvent({this.appTheme});

  @override
  List<Object> get props => [appTheme];
}
