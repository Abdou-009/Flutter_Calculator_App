import 'package:exemple/calculator_bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CalculatorBloc(),
      child: CalculatorContent(),
    );
  }
}

class CalculatorContent extends StatelessWidget {
  // dynamic displaytxt = 0;

  CalculatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorInitial) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            ' ${state.display}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(context, 'C', Colors.red.shade400, Colors.black),
                calcbutton(context, '()', Colors.amber, Colors.black),
                calcbutton(context, '%', Colors.amber, Colors.black),
                calcbutton(context, '/', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(context, '7', Colors.grey.shade700, Colors.white),
                calcbutton(context, '8', Colors.grey.shade700, Colors.white),
                calcbutton(context, '9', Colors.grey.shade700, Colors.white),
                calcbutton(context, 'x', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(context, '4', Colors.grey.shade700, Colors.white),
                calcbutton(context, '5', Colors.grey.shade700, Colors.white),
                calcbutton(context, '6', Colors.grey.shade700, Colors.white),
                calcbutton(context, '-', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(context, '1', Colors.grey.shade700, Colors.white),
                calcbutton(context, '2', Colors.grey.shade700, Colors.white),
                calcbutton(context, '3', Colors.grey.shade700, Colors.white),
                calcbutton(context, '+', Colors.amber, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton(context, '+/-', Colors.grey.shade700, Colors.white),
                calcbutton(context, '0', Colors.grey.shade700, Colors.white),
                calcbutton(context, '.', Colors.grey.shade700, Colors.white),
                calcbutton(context, '=', Colors.green.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Button Widget
  Widget calcbutton(
      BuildContext context, String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          // Dispatch events to the bloc based on the button text
          if (btntxt == 'C') {
            context.read<CalculatorBloc>().add(ClearBtnPressed());
          } else if (btntxt == '=') {
            context.read<CalculatorBloc>().add(EqualBtnPressed());
          } else {
            context.read<CalculatorBloc>().add(TextBtnPressed(TextBtn: btntxt));
          }
        },
        shape: const CircleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(20),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
      ),
    );
  }
}
