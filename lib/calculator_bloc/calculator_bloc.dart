import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exemple/calculator_bloc/logic.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final Logic logic = Logic();
  CalculatorBloc() : super(CalculatorInitial(display: '0')) {
    on<NumBtnPressed>((event, emit) {
      logic.calculation(event.NumBtn);
      emit(CalculatorInitial(display: logic.finalResult));
    });
    on<TextBtnPressed>((event, emit) {
      logic.calculation(event.TextBtn);
      emit(CalculatorInitial(display: logic.finalResult));
    });
    on<ClearBtnPressed>((event, emit) {
      logic.calculation('C');
      emit(CalculatorInitial(display: logic.finalResult));
    });
    on<EqualBtnPressed>((event, emit) {
      logic.calculation('=');
      emit(CalculatorInitial(display: logic.finalResult));
    });
  }
}
