import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_bloc_state.dart';

abstract class BaseCubit<T extends BaseBlocState> extends Cubit<T> {
  BaseCubit(super.initialState);

  void safeEmit(T newState) {
    if (!isClosed) emit(newState);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Bloc Error: $error');
  }
}
