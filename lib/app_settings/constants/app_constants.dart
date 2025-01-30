import 'package:flutter/material.dart';

final class AppConstants {
  static AppConstants? _instance;

  static AppConstants get instance => _instance ??= AppConstants._init();

  AppConstants._init();
  //Key
  static final GlobalKey<NavigatorState> baseNavigatorKey = GlobalKey();

  String _currentScreenName = "/";
  setCurrentScreenName(String screenName) {
    _currentScreenName = screenName;
  }

  get currentScreenName => _currentScreenName;

  static const languageAssetPath = "assets/lang";

  static const baseApiUrl = "http://18.232.174.110/api/";
  static const emptyRequest = {"": []};
}
