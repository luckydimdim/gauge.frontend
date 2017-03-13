import 'dart:core';
import 'dart:html';
import 'package:alert/alert_service.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'package:resources_loader/resources_loader.dart';
import 'package:master_layout/master_layout_component.dart';

import 'package:gauge/gauge.dart';

bool get isDebug =>
  (const String.fromEnvironment('PRODUCTION', defaultValue: 'false')) != 'true';

@Component(selector: 'app')
@View(
  template: '''
    <master-layout>
      <gaaaauge></gaaaauge>
    </master-layout>''',
  directives: const [MasterLayoutComponent, GaugeComponent])
class AppComponent {}

@Component(selector: 'gaaaauge')
@View(
  template: '<canvas id="gauge"></canvas>')
class GaugeComponent implements AfterViewInit {
  @override
  ngAfterViewInit() async {
    var grayDark = '#2a2c36';
    var brandInfo = '#63c2de';
    var grayLighter = '#d1d4d7';


    ResourcesLoaderService resourcesLoader = new ResourcesLoaderService();

    var options = new GaugeOptions()
      ..angle = 0.15
      ..lineWidth = 0.44
      ..pointer = new PointerOptions(length: 0.8,strokeWidth:0.035,color: grayDark )
      ..limitMax = false
      ..colorStart = brandInfo
      ..colorStop = brandInfo
      ..strokeColor = grayLighter
      ..generateGradient = true;

    var gauge = new Gauge(resourcesLoader, querySelector('#gauge') as CanvasElement, options);

    var success = await gauge.Init();

    gauge.maxValue = 3000; // set max gauge value
    gauge.animationSpeed = 32; // set animation speed (32 is default value)
    gauge.set(2000); // set actual value
  }
}

main() async {
  if (isDebug) {
    reflector.trackUsage();
  }

  ComponentRef ref = await bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy),
    const Provider(ResourcesLoaderService),
    const Provider(AlertService)
  ]);

  if (isDebug) {
    print('Application in DebugMode');
    enableDebugTools(ref);
    print('Unused keys: ${reflector.listUnusedKeys()}');
  }
}