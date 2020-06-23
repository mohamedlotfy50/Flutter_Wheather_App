part of 'themebloc_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({this.themeData});

  @override
  List<Object> get props => [themeData];
}
