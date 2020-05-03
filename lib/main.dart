import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder, // <--- Add the builder
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutTemplate(),
    );
  }
}

class LayoutTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ScreenTypeLayout(
    //   breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
    //   mobile: Container(color: Colors.blue),
    //   tablet: Container(color: Colors.yellow),
    //   desktop: Container(color: Colors.red),
    //   watch: Container(color: Colors.purple),
    // );

    // return OrientationLayoutBuilder(
    //   portrait: (context) => Container(color: Colors.green),
    //   landscape: (context) => Container(color: Colors.pink),
    // );

    // return ScreenTypeLayout.builder(
    //   mobile: (BuildContext context) => Container(color: Colors.blue),
    //   tablet: (BuildContext context) => Container(color: Colors.yellow),
    //   desktop: (BuildContext context) => Container(color: Colors.red),
    //   watch: (BuildContext context) => Container(color: Colors.purple),
    // );

    return ResponsiveBuilder(
      // breakpoints: ,
      builder: (context, sizeInfo) {
        // sizeInfo.deviceScreenType
        // sizeInfo.isDesktop;
        // sizeInfo.isMobile
        // sizeInfo.isTablet
        // sizeInfo.isWatch
        // sizeInfo.screenSize.aspectRatio
        // sizeInfo.screenSize.bottomCenter();
        // sizeInfo.screenSize.width
        // sizeInfo.screenSize.height

        return Scaffold(
          appBar: sizeInfo.isWatch
              ? null
              : AppBar(title: Text('Responsive Builder')),
          body: Center(
            child: Text('data'),
          ),
        );
      },
    );
  }
}
