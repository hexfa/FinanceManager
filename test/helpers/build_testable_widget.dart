import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';
import 'setting_cubit_fake.dart';

Widget buildTestableWidget(
  Widget widget, {
  SettingCubit? settingCubit,
  NavigatorObserver? navigatorObserver,
}) {
  final cubit = settingCubit ?? SettingCubitFake();
  return MaterialApp(
    home: BlocProvider<SettingCubit>.value(value: cubit, child: widget),
    navigatorObservers: [if (navigatorObserver != null) navigatorObserver],
  );
}
