import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  @protected
  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
