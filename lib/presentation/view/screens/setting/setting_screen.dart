import 'package:finance_manager/core/constants/currency_list.dart';
import 'package:finance_manager/data/models/currency.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_cubit.dart';
import 'package:finance_manager/presentation/bloc/setting/setting_state.dart';
import 'package:finance_manager/presentation/view/base/base_stateless_widget.dart';
import 'package:finance_manager/presentation/view/widgets/appbar/custom_app_bar.dart';
import 'package:finance_manager/presentation/view/widgets/dropdown/custom_drop_down.dart';
import 'package:finance_manager/presentation/view/widgets/switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends BaseStatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: localization(context).settings),
      body: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomDropdown<Currency>(
                  items: currencyList,
                  value: state.currency,
                  onChanged: (value) {
                    if (value != null) {
                      getBloc<SettingCubit>(context).changeCurrency(value);
                    }
                  },
                  label: localization(context).currency,
                  itemLabelBuilder:
                      (currency) => '${currency.code} - ${currency.name}',
                ),
                SizedBox(height: 16),
                CustomSwitch(
                  label: localization(context).darkTheme,
                  value: state.isDarkTheme,
                  onChanged: (value) {
                    getBloc<SettingCubit>(context).toggleDarkTheme(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
