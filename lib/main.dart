import 'package:crud_bloc/src/app_route.dart';
import 'package:crud_bloc/src/bloc/app_bloc_observer.dart';
import 'package:crud_bloc/src/bloc/crud_bloc.dart';
import 'package:crud_bloc/src/models/device_model.dart';
import 'package:crud_bloc/src/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(DeviceModelAdapter());
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final crudBloc = BlocProvider<CrudBloc>(create: (context) => CrudBloc());

    return MultiBlocProvider(
      providers: [crudBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

