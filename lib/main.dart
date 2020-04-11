import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/myapp.dart';
import 'package:flutter_template/service_locator.dart';

main() {
  setupLocator();
  SystemChrome.setEnabledSystemUIOverlays([]);
  CatcherOptions debugOptions =
  CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["alphatesfa789@gmail.com"])
  ]);

  Catcher(MyApp(), debugConfig: debugOptions, releaseConfig: releaseOptions);
}