import 'package:get_it/get_it.dart';
import 'inject_bloc.dart';
import 'inject_color.dart';
import 'inject_textstyle.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await injectColors();
  await injectTextStyles();
  await injectBlocs();
}