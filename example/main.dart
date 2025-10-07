import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_autosize_screen_pro/flutter_autosize_screen_pro.dart';

void main() {
  /// Set the standard width for your design (e.g., 360 for a typical mobile design)
  FlutterAutosizeScreenPro.setStandard(360, isAutoTextSize: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'autosize screen pro',

      /// Use the appBuilder to wrap the app with the autosize functionality
      builder: FlutterAutosizeScreenPro.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle style = TextStyle(color: Colors.white);
  final GlobalKey keyGreen = GlobalKey();
  final GlobalKey keyBlue = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var renderBox = keyGreen.currentContext!.findRenderObject()!.paintBounds;
      var sizeGreen = renderBox.size;
      print("${sizeGreen.width} ----- ${sizeGreen.height}");

      var renderBlu = keyBlue.currentContext!.findRenderObject()!.paintBounds;
      var sizeBlue = renderBlu.size;
      print("${sizeBlue.width} ----- ${sizeBlue.height}");
      print("${FlutterAutosizeScreenPro.getScreenSize()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var originalSize = window.physicalSize / window.devicePixelRatio;
    var nowDevicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text("autosize screen pro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                /// Use Expanded to split the screen in half
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    key: keyGreen,
                    height: 60,
                    color: Colors.redAccent,
                    child: Text(
                      "Use Expanded to split the screen in half",
                      style: style,
                    ),
                  ),
                ),

                /// Use Expanded to split the screen in half
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    color: Colors.blue,
                    child: Text(
                      "Use Expanded to split the screen in half",
                      style: style,
                    ),
                  ),
                ),
              ],
            ),

            /// Use mainAxisSize to set the width of the container
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  key: keyBlue,
                  width: 215,
                  height: 60,
                  color: Colors.green,
                  child: Text(
                    "The width is 180",
                    style: style,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 215,
                  height: 60,
                  color: Colors.grey,
                  child: Text(
                    "The width is 180",
                    style: style,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 360,
              height: 60,
              color: Colors.purple,
              child: Text(
                "The width is 360",
                style: style,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text("original size: $originalSize"),
            Text("Native resolution: ${window.physicalSize}"),
            Text(
                "Original devicePixelRatio: ${MediaQuery.of(context).devicePixelRatio}"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              width: 360,
              height: 10,
              color: Colors.grey,
            ),
            Text("size after change: ${MediaQuery.of(context).size}"),
            Text("After changing devicePixelRatio: $nowDevicePixelRatio"),
          ],
        ),
      ),
    );
  }
}
