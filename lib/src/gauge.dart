@JS()
library gauge;

import 'dart:async';
import 'package:js/js.dart';
import 'dart:html';
import 'dart:js';
import 'package:resources_loader/resources_loader.dart';

@anonymous
@JS()
class PointerOptions {
  /*
  * The radius of the inner circle
  */
  external double get length;

  external set length(double v);

  /*
  * The thickness
  */
  external double get strokeWidth;

  external set strokeWidth(double v);

  /*
  * Fill color
  */
  external String get color;

  external set color(String v);

  external factory PointerOptions(
      {double length, double strokeWidth, String color});

}

@anonymous
@JS()
class GaugeOptions {


  /*
  * The span of the gauge arc
  */
  external double get angle;

  external set angle(double v);

  /*
  * The line thickness
  */
  external double get lineWidth;

  external set lineWidth(double v);

  /*
  *
  */
  external PointerOptions get pointer;

  external set pointer(PointerOptions v);

  /*
  * If true, the pointer will not go past the end of the gauge
  */
  external bool get limitMax;

  external set limitMax(bool v);

  /*
  * Colors
  */
  external String get colorStart;

  external set colorStart(String v);

  /*
  * just experiment with them
  */
  external String get colorStop;

  external set colorStop(String v);

  /*
  * to see which ones work best for you
  */
  external String get strokeColor;

  external set strokeColor(String v);

  /*
  *
  */
  external bool get generateGradient;

  external set generateGradient(bool v);

  /*
  * High resolution support
  */
  external bool get highDpiSupport;

  external set highDpiSupport(bool v);

}

@JS('Gauge')
class _Gauge {

  /*
  * max gauge value
  */
  external int get maxValue;

  external set maxValue(int v);

  /*
  * animation speed (32 is default value)
  */
  external int get animationSpeed;

  external set animationSpeed(int v);

  external factory _Gauge(String target);

  external setOptions(GaugeOptions options);

  /*
  * actual value
  * */
  external set(int value);
}

@JS('Donut')
class _Donut {
  /*
  * max gauge value
  */
  external int get maxValue;

  external set maxValue(int v);

  /*
  * animation speed (32 is default value)
  */
  external int get animationSpeed;

  external set animationSpeed(int v);

  external factory _Donut(String target);

  external setOptions(GaugeOptions options);

  /*
  * actual value
  * */
  external set(int value);
}


class Donut {
  ResourcesLoaderService _resourcesLoader;
  _Donut _donut;
  dynamic context;
  GaugeOptions options;

  Donut(this._resourcesLoader, this.context, this.options) {


  }

  Future<bool> Init() async {

    bool success = await _resourcesLoader.loadScriptAsync('packages/gauge/src/bower_components/gauge.js/dist/', 'gauge.js', false);

    if (!success)
      return false;

    _donut = new _Donut(context).setOptions(options);

    return true;

  }

  /*
  * max gauge value
  */
  int get maxValue => _donut.maxValue;

  void set maxValue(int v) {
    _donut.maxValue = v;
  }

  /*
  * animation speed (32 is default value)
  */
  int get animationSpeed => _donut.animationSpeed;

  void set animationSpeed(int v) {
    _donut.animationSpeed = v;
  }

  /*
  * actual value
  * */
  void set(int value) {
    _donut.set(value);
  }
}

class Gauge {
  ResourcesLoaderService _resourcesLoader;
  _Gauge _gauge;
  dynamic context;
  GaugeOptions options;

  Gauge(this._resourcesLoader, this.context, this.options) {


  }

  Future<bool> Init() async {

    bool success = await _resourcesLoader.loadScriptAsync('packages/gauge/src/bower_components/gauge.js/dist/', 'gauge.js', false);

    if (!success)
      return false;

    _gauge = new _Gauge(context).setOptions(options);

    return true;

  }

  /*
  * max gauge value
  */
  int get maxValue => _gauge.maxValue;

  void set maxValue(int v) {
    _gauge.maxValue = v;
  }

  /*
  * animation speed (32 is default value)
  */
  int get animationSpeed => _gauge.animationSpeed;

  void set animationSpeed(int v) {
    _gauge.animationSpeed = v;
  }

  /*
  * actual value
  * */
  void set(int value) {
    _gauge.set(value);
  }
}
