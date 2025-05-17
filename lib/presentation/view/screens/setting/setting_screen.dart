import 'package:finance_manager/core/di/di.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingCubit>(),
      child: Scaffold(appBar: CustomAppBar(title: 'Setting')),
    );
  }
}
