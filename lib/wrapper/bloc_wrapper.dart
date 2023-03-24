import 'dart:async';

import 'package:bloc_test/wrapper/auth_repo.dart';

class BlocWrapper {
  final AuthRepo _authRepo = AuthRepo();

  late StreamController<String> fetchUserDataController;

  StreamSink<String> get fetchUserDataSink => fetchUserDataController.sink;

  static BlocWrapper? _instance;
  static BlocWrapper get instance => _instance ??= BlocWrapper();

  BlocWrapper() {
    fetchUserDataController = StreamController<String>.broadcast();
  }

  getUserData() async {
    fetchUserDataSink.add("Loading..");
    try {
      String userData = await _authRepo.fetchUserData();
      print(userData);
      fetchUserDataSink.add(userData);
    } catch (e) {
      print("Error $e");
      fetchUserDataSink.add("Error!");
    }
  }

  dispose() {
    _instance = null;
    fetchUserDataController.close();
  }
}
