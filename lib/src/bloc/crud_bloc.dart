import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crud_bloc/src/models/device_model.dart';
import 'package:crud_bloc/src/services/database_service.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    List<DeviceModel> devices= [];
    on<AddDevice>((event, emit) async {
      // DatabaseService.addTask(
      //   DeviceModel(title: event.title),
      // );
      devices.add(DeviceModel(title: event.title));
      // log("OK");
      print("OKKKKKKKKKKKKKKKKK");
      log('${devices.first.toJson()}');
      log('hi');
    });


  }
}
