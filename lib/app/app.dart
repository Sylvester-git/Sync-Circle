import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import '../package_barrel.dart';
import '../util/app_router.dart';
import '../util/theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot._();

  static const AppRoot instance = AppRoot._();
  factory AppRoot() => instance;

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routes,
        theme: lightTheme(),
      ),
    );
  }
}
