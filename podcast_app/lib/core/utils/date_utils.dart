import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateUtils {
  static final DateFormat defaultFormat = DateFormat("dd.MM.yyyy");

  static DateTime dateFromString({@required String dateString, @required DateFormat formatter}) {
    return formatter.parse(dateString);
  }
}
