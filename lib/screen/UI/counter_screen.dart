import 'package:bloc_sm/bloc/counter/counter_bloc.dart';
import 'package:bloc_sm/bloc/counter/counter_events.dart';
import 'package:bloc_sm/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //to track a changes
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(state.counter.toString(),
                  style: const TextStyle(fontSize: 20));
            }),
            ElevatedButton(onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            }, child: const Text('Increment')),
            ElevatedButton(onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            }, child: const Text('Decrement')),
          ],
        ),
      ),
    );
  }
}
