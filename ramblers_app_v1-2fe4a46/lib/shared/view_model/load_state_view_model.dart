import 'package:flutter/material.dart';
import 'package:mississauga/res/constants/global_variables.dart';

class LoadStateViewModel with ChangeNotifier {
  LoadState _loadState = LoadState.loaded;

  LoadState get loadState => _loadState;

  set isLoading(LoadState isLoading) {
    _loadState = isLoading;
    notifyListeners();
  }

  void init(){}
}
