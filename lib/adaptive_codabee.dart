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

  static button({required Widget child, required VoidCallback onPressed}){
    return (isWeb()) ? webButton(child: child, onPressed: onPressed) : androidButton(child: child, onPressed: onPressed);
  }

  static Future alert({required BuildContext context}) {
    return showDialog(context: context,
        builder: (context) {
          return (kIsWeb) ? webErrorAlert(context: context) : androidErrorAlert(context: context);
        });
  }

  //Android
  static Scaffold androidScaffold({required String string, required Widget body}){
    return Scaffold(
      appBar: AppBar(title: Text(string), backgroundColor: Colors.pink,
      ),
      body: body,
    );
  }

  static ElevatedButton androidButton({required Widget child, required VoidCallback onPressed}){
    return ElevatedButton(onPressed: onPressed, child: child);
  }

  static Text androidText({required String string, required TextStyle style,  TextAlign? align}){
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.right,
    );
  }

  static AlertDialog androidErrorAlert({required BuildContext context}) {
    return  AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              text(string: "Une erreur est apparue"),
            ],
          ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: text(string: "OK"))
      ],
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

  static ElevatedButton webButton({required Widget child, required VoidCallback onPressed}){
    return ElevatedButton(onPressed: onPressed, child: child);
  }

  static AlertDialog webErrorAlert({required BuildContext context}) {
    return AlertDialog(
            content: Column(

              children: [
                text(string: "Une erreur est apparue"),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: text(string: "not OK"))
              ],
            ),
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
