import 'package:bloc_sm/bloc/switch/switch_event.dart';
import 'package:bloc_sm/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch/switch_bloc.dart';

class MultipleStates extends StatefulWidget {
  const MultipleStates({super.key});

  @override
  State<MultipleStates> createState() => _MultipleStatesState();
}

class _MultipleStatesState extends State<MultipleStates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple States"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Notification"),
                  BlocBuilder<SwitchBloc,SwitchState>(
                      buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                      builder: (context,state){
                        print("Notification");
                    return  Switch(value: state.isSwitch, onChanged: (newValue){
                      print(state.isSwitch);
                      context.read<SwitchBloc>().add(EnableOrDisableNotificationEvent());
                    });
                  }),

                ],
              ),
              const SizedBox(height: 30,),
              BlocBuilder<SwitchBloc,SwitchState>(
                  buildWhen: (previous, current) => previous.slider != current.slider,

                  builder: (context,state){
                return Container(
                  height: 200,
                  color: Colors.black.withOpacity(state.slider),
                );
              }),

              const SizedBox(height: 30,),
              BlocBuilder<SwitchBloc,SwitchState>(
                  buildWhen: (previous, current) => previous.slider != current.slider,
                  builder: (context,state){
                return Slider(value: state.slider, onChanged:(value){
                  print(value);
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                });
              }),



            ],
          ),
        ),
      ),
    );
  }
}
