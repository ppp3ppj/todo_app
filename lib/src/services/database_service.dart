import 'dart:developer';

import 'package:crud_bloc/src/models/device_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class DatabaseService {
  // static final DatabaseService instance = DatabaseService._init();
  Future<void> addTask(DeviceModel device) async {
    log('devide : ${device.id}');
    final deviceDB = await Hive.openBox<DeviceModel>('${device.id}');
    final id = await deviceDB.add(device);
    log(device.toJson().toString());
  }
}