import 'package:flutter/material.dart';
import 'package:open_weather/bloc/states.dart';
import 'package:open_weather/utils/language_utils.dart';

void showSnackBar(ErrorState state, double snackBarPosition, BuildContext context) {
  String message = state.errorCode != null
      ? '${LanguageUtils.errorCode}: ${state.errorCode}.\n'
      '${LanguageUtils.errorMessage}: ${state.errorMessage}'
      : '${LanguageUtils.errorMessage}: ${state.errorMessage}';
  final snackBar = SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: snackBarPosition),
      content: SizedBox(
          height: 50,
          child: Text(message)
      )
  );
  //remove old SnackBar
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}