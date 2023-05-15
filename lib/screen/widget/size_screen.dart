import 'package:flutter/material.dart';

class SizeScreen {
  double? _heightScreen;
  double? _widthScreen;

  get heightScreen => _heightScreen;

  get widthScreen => _widthScreen;

  mediaQuerySize(BuildContext context) {
    _heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _widthScreen = MediaQuery.of(context).size.width;
  }
}
