import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/widgets/forecast_item_widget.dart';

void main() {
  testWidgets('forecastItem displays correct time, icon, and temperature', (WidgetTester tester) async {
    // Arrange
    const time = '09:00';
    const icon = '01d'; // Clear sky icon
    const temp = '25°';

    // Create the widget to test
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ForecastItemWidget().forecastItem(time, icon, temp),
      ),
    ));

    // Act
    final timeFinder = find.text(time);
    final tempFinder = find.text(temp);
    final iconFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Image &&
          widget.image.toString().contains(icon),
    );

    // Assert
    expect(timeFinder, findsOneWidget);
    expect(tempFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });
}