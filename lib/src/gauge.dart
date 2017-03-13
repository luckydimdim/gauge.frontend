@JS()
library gauge;

import 'package:js/js.dart';

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

  external factory GaugeOptions({double  angle,
    double  lineWidth,
    PointerOptions  pointer,
    bool  limitMax,
    String  colorStart,
    String  colorStop,
    String  strokeColor,
    bool  generateGradient,
    bool  highDpiSupport});
}

@JS('Gauge')
abstract class GaugeStatic {

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

  external factory GaugeStatic(dynamic target);

  external dynamic setOptions([GaugeOptions options]);

  /*
  * actual value
  * */
  external set(int value);
}

@JS()
external GaugeStatic get Gauge;
@JS()
external set Gauge(GaugeStatic v);


@JS('Donut')
class DonutStatic {
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

  external factory DonutStatic(dynamic target);

  external dynamic setOptions([GaugeOptions options]);

  /*
  * actual value
  * */
  external set(int value);
}

@JS()
external DonutStatic get Donut;
@JS()
external set Donut(DonutStatic v);