import 'dart:developer';

import 'package:bloc/bloc.dart';


class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("AppBlocObserver" + transition.toString());
    // log("AppBlocObserver" + transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    // log(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}