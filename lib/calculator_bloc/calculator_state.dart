part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {}

// ======================================

class CalculatorInitial extends CalculatorState {
  final String display;

  CalculatorInitial({required this.display});
  @override
  List<Object?> get props => [display];
}

// ======================================
