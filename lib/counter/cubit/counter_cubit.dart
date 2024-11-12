import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() {
    final newState = state + 1;
    emit(newState);
    _checkMultipleOfFive(
        newState); // Periksa kelipatan 5 setelah setiap perubahan state
  }

  /// Subtract 1 from the current state.
  void decrement() {
    final newState = state - 1;
    emit(newState);
    _checkMultipleOfFive(newState);
  }

  /// Multiply the current state by 2.
  void multiplyBy2() {
    final newState = state * 2;
    emit(newState);
    _checkMultipleOfFive(newState);
  }

  /// Subtract 2 from the current state.
  void subtract2() {
    final newState = state - 2;
    emit(newState);
    _checkMultipleOfFive(newState);
  }

  /// Reset the counter to 0.
  void reset() {
    emit(0);
  }

  /// Cek apakah nilai counter adalah kelipatan 5
  void _checkMultipleOfFive(int newState) {
    if (newState % 5 == 0 && newState != 0) {}
  }
}
