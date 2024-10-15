import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

abstract class SafeActionCubit<State extends Object, Action>
    extends ActionCubit<State, Action> {
  SafeActionCubit(super.initialState);

  @protected
  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @protected
  @override
  void dispatch(Action action) {
    if (!isClosed) {
      super.dispatch(action);
    }
  }
}
