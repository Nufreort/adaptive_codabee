library adaptive_codabee;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Adaptive {

  //Check Platform

  static bool isWeb() => (kIsWeb);

  //Material Design Adapted
  static Widget scaffold({required String string, required Widget widget}) {
    return (isWeb()) ? webScaffold(string: string, body: widget) : androidScaffold(string: string, body: widget);
  }

  static text({required String string, Color? color, double? size, TextAlign? align}) {
    TextStyle style = textStyle(color: color, size: size);
    return (kIsWeb) ? webText(string: string, style: style, align: align) : androidText(string: string, style: style, align: align);
  }
  //Android
  static Scaffold androidScaffold({required String string, required Widget body}){
    return Scaffold(
      appBar: AppBar(title: Text(string), backgroundColor: Colors.pink,
      ),
      body: body,
    );
  }

  static Text androidText({required String string, required TextStyle style,  TextAlign? align}){
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.right,
    );
  }

  //Web design
  static Scaffold webScaffold({required String string, required Widget body}){
    return Scaffold(
      appBar: AppBar(title: Text(string),
        backgroundColor: Colors.green,
      ),
      body: body,
    );
  }

  static Text webText({required String string, required TextStyle style,  TextAlign? align}){
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.left,
    );
  }

  //Both Material
  static TextStyle textStyle({Color? color, double? size, TextAlign? align}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,

    );
  }
}
