import 'package:bloc/bloc.dart';
import 'package:bloc_sm/bloc/switch/switch_event.dart';
import 'package:bloc_sm/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchState>{
  SwitchBloc() : super(const SwitchState()){
    on<EnableOrDisableNotificationEvent>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotificationEvent events, Emitter<SwitchState> emit){
   emit(state.copyWith(isSwitch: !state.isSwitch));

  }
  void _slider(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider));

  }

}