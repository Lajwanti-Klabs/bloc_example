import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;

  const CounterState({this.counter =0});

  // when we use copy with function which access from equatable package.
  // copy with function create a new instance and  to help out our override value.
  //

  CounterState copyWith({int? counter}){
    return CounterState(
      counter: counter ?? this.counter,
    );
  }


  @override
  List<Object?> get props => [counter];

}