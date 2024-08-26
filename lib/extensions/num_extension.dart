import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_data.dart';

extension numExtension on num {
  DateTime get milliSecondToDate => DateTime.fromMillisecondsSinceEpoch(this.toInt() * 1000);


}
