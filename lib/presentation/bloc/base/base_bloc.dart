import 'package:finance_manager/presentation/bloc/base/base_bloc_state.dart';
import 'package:finance_manager/presentation/bloc/base/base_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<TEvent extends BaseEvent, TState extends BaseBlocState>
    extends Bloc<TEvent, TState> {
  BaseBloc(super.initialState);
}
