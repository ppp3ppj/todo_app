part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();
}

class AddDevice extends CrudEvent {
  // final int id;
  final String title;

  AddDevice({required this.title});


  @override
  List<Object?> get props =>
      [title];
}



