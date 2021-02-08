import 'package:intl/intl.dart';

class Util {

  static var _format = DateFormat("EEE, MMM d, y");

  static String getFormattedDate(DateTime dateTime) {
    return _format.format(dateTime);
  }
}