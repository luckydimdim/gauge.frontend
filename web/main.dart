import 'dart:core';
import 'dart:html';

import 'package:gauge/gauge.dart';
import 'package:resources_loader/resources_loader.dart';


main() async {

  var grayDark =      '#2a2c36';
  var brandInfo =     '#63c2de';
  var grayLighter =   '#d1d4d7';

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

  await gauge.Init();

  gauge.maxValue = 3000; // set max gauge value
  gauge.animationSpeed = 32; // set animation speed (32 is default value)
  gauge.set(2000); // set actual value
}