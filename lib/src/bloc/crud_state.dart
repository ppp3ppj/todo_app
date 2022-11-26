part of 'crud_bloc.dart';

abstract class CrudState extends Equatable {
  const CrudState();
}

class CrudInitial extends CrudState {
  @override
  List<Object> get props => [];
}

class DisplayTodos extends CrudState {
  final List<DeviceModel> device;
  const DisplayTodos({required this.device});

  @override
  List<Object> get props => [device];
}

class DisplaySpecificTodo extends CrudState {
  final List<DeviceModel> device;
  const DisplaySpecificTodo({required this.device});

  @override
  List<Object> get props => [device];
}