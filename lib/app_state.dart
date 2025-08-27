import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userid = '0';
  String get userid => _userid;
  set userid(String value) {
    _userid = value;
  }

  String _selectedMenu = 'o';
  String get selectedMenu => _selectedMenu;
  set selectedMenu(String value) {
    _selectedMenu = value;
  }
}
