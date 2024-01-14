import 'package:bloc_sm/bloc/switch/switch_state.dart';
import 'package:equatable/equatable.dart';

abstract class SwitchEvents {
  const SwitchEvents();
  @override
  List<Object> get props => [];

}

class EnableOrDisableNotificationEvent extends SwitchEvents{}

class SliderEvent extends SwitchEvents{
  double slider;

  SliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
