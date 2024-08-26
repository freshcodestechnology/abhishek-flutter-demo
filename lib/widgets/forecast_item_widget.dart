import 'package:flutter/material.dart';
import 'package:weather_app/utility/color_constants.dart';

class ForecastItemWidget {
  Widget forecastItem(String time, String icon, String temp) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: ColorConstants.tileColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Image.network(errorBuilder: (context, error, stackTrace) {
              return Image.network(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freeiconspng.com%2Fimages%2Ferror-icon&psig=AOvVaw2HLM2bU4W7-pviiQhqHPwZ&ust=1724758773868000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMDgyKPJkogDFQAAAAAdAAAAABAJ');
            }, 'https://openweathermap.org/img/wn/$icon.png'),
            const SizedBox(height: 10),
            Text(
              temp,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
