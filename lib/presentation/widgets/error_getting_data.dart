import 'package:flutter/material.dart';
import 'package:open_weather/utils/language_utils.dart';

class ErrorGettingData extends StatelessWidget {
  const ErrorGettingData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          LanguageUtils.errorGettingData,
          style: const TextStyle(
              fontSize: 30.0,
              color: Colors.white
          ),
        )
    );
  }
}