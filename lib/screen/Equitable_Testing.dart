
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquitableTesting extends StatefulWidget {
  const EquitableTesting({super.key});


  @override
  State<EquitableTesting> createState() => _State();
}

class _State extends State<EquitableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person person = Person(name: 'Lajwanti', age: '25');
          Person person1 = Person(name: 'Lajwanti', age: '25');
         // Person person1 = Person(name: 'Laaj', age: '25');

          debugPrint(person.hashCode.toString());
          debugPrint(person1.hashCode.toString());

          print(person==person1);

          PersonClass personClass = const PersonClass(name: 'Lajwanti', age: '25');
          PersonClass personClass1 = const PersonClass(name: 'Lajwanti', age: '25');
         // Person person1 = Person(name: 'Laaj', age: '25');

          debugPrint(personClass.hashCode.toString());
          debugPrint(personClass1.hashCode.toString());

          print(personClass==personClass1);
        },
        child: const Text("Click"),
      ),
    );
  }
}


class Person {
  final String name;
  final String age;

  Person({required this.name, required this.age});


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;
    }


  @override

  int get hashCode => name.hashCode ^ age.hashCode;

}

class PersonClass extends Equatable{
  final String? name;
  final String? age;
  const PersonClass({this.name,this.age});


  @override
  List<Object?> get props => [name,age];

}
