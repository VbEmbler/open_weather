import 'package:flutter/material.dart';
import 'package:open_weather/utils/language_utils.dart';
import 'package:open_weather/utils/navigation_utils.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String city = '';
    return Column(
      children: [
        TextField(
          textCapitalization: TextCapitalization.sentences,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            decorationThickness: 0
          ),
          cursorColor: Colors.white70,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            label: Center(child: Text(LanguageUtils.enterCity),),
            labelStyle: const TextStyle(
                color: Colors.white70,
                fontSize: 25.0
            ),
            filled: true,
            fillColor: Colors.black26,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0,
                    color: Colors.black26
                ),
                borderRadius: BorderRadius.circular(25.0)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0,
                    color: Colors.black26
                ),
                borderRadius: BorderRadius.circular(25.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0,
                    color: Colors.black26
                ),
                borderRadius: BorderRadius.circular(25.0)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0,
                    color: Colors.black26
                ),
                borderRadius: BorderRadius.circular(25.0)
            ),
          ),
          onChanged: (value) {
            city = value;
          },
        ),
        const SizedBox(height: 25.0),
        SizedBox(
          height: 50.0,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent
            ),
              onPressed: (){
                openWeatherForecastPage(context: context, city: city);
              },
              child: Text(
                LanguageUtils.getForecast,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white70
                ),
              )
          ),
        ),
      ],
    );
  }
}
