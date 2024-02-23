import 'package:exemple/calculator.dart';
import 'package:exemple/calculator_bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculatorBloc()),
      ],
      child: MaterialApp(
        home: Calculator(),
      ),
    );
  }
}
