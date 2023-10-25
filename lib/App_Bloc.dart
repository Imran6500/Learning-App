import 'package:bloc/bloc.dart';
import 'package:bloc_counter/App_Event.dart';
import 'package:bloc_counter/App_State.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  AppBloc() : super(InitState()) {
    print("App bloc");
    on<Increament>((event, ask) {
      ask(AppStates(counter: state.counter + 1));
    });
    on<Decreament>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
