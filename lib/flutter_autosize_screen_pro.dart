import 'package:flutter/material.dart';

class FlutterAutosizeScreenPro {
  static double _devicePixelRatio = 3.0;
  static double _screenWidth = 300;
  static double _screenHeight = 800;
  static double _screenStandard = 360;
  static Size _screenSize = Size.zero;
  static bool _autoTextSize = true;

  static void setStandard(double standard, {bool isAutoTextSize = true}) {
    _screenStandard = standard;
    _autoTextSize = isAutoTextSize;
  }

  // Pass BuildContext instead of using window
  static double getDevicePixelRatio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = size.height > size.width ? "portrait" : "landscape";
    if (orientation == "portrait") {
      _devicePixelRatio = size.width / _screenStandard;
    } else {
      _devicePixelRatio = size.height / _screenStandard;
    }
    return _devicePixelRatio;
  }

  static Size getSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = size.height > size.width ? "portrait" : "landscape";

    if (orientation == "portrait") {
      _screenHeight = size.height / getDevicePixelRatio(context);
      _screenWidth = _screenStandard;
      _screenSize = Size(_screenStandard, _screenHeight);
    } else {
      _screenWidth = size.width / getDevicePixelRatio(context);
      _screenHeight = _screenStandard;
      _screenSize = Size(_screenWidth, _screenStandard);
    }
    return _screenSize;
  }

  static Size getScreenSize() {
    return _screenSize;
  }

  static Widget appBuilder(BuildContext context, Widget? widget) {
    final dpRatio = getDevicePixelRatio(context);

    final viewInsets = MediaQuery.of(context).viewInsets;
    final padding = MediaQuery.of(context).padding;
    final viewPadding = MediaQuery.of(context).viewPadding;

    final adapterEdge = EdgeInsets.fromLTRB(viewInsets.left, viewInsets.top,
        viewInsets.right, getRealSize(viewInsets.bottom, dpRatio));

    final adapterPadding = EdgeInsets.fromLTRB(
        padding.left,
        getRealSize(padding.top, dpRatio),
        padding.right,
        getRealSize(padding.bottom, dpRatio));

    final adapterViewPadding = EdgeInsets.fromLTRB(
        viewPadding.left,
        getRealSize(viewPadding.top, dpRatio),
        viewPadding.right,
        getRealSize(viewPadding.bottom, dpRatio));

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        size: Size(_screenWidth, _screenHeight),
        devicePixelRatio: dpRatio,
        textScaler: _autoTextSize
            ? MediaQuery.of(context).textScaler
            : TextScaler.linear(1.0),
        viewInsets: adapterEdge,
        padding: adapterPadding,
        viewPadding: adapterViewPadding,
      ),
      child: _adapterTheme(context, widget),
    );
  }

  static double getRealSize(double size, double dpRatio) {
    return size / (dpRatio);
  }

  static _adapterTheme(BuildContext context, Widget? widget) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: widget!,
    );
  }
}
