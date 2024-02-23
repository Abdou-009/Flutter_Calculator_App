part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {}

// ======================================

class NumBtnPressed extends CalculatorEvent {
  final String NumBtn;

  NumBtnPressed({required this.NumBtn});
  @override
  List<Object?> get props => [NumBtn];
}

// ======================================

class TextBtnPressed extends CalculatorEvent {
  final String TextBtn;

  TextBtnPressed({required this.TextBtn});
  @override
  List<Object?> get props => [TextBtn];
}

// ======================================

class ClearBtnPressed extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}

// ======================================

class EqualBtnPressed extends CalculatorEvent {
  @override
  List<Object?> get props => [];
}
