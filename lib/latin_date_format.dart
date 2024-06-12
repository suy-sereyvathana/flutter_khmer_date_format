import 'package:intl/intl.dart';
import 'package:khmer_date_format/constants/constant_functions.dart';
import 'package:khmer_date_format/constants/constant_variables.dart';

class LatinDateFormat {
  static DateTime formatLatinDate(String date) {
    DateTime latinDate = DateTime.now();

    List dateArray = date.split('-').toList();

    int day = ConstantFunctions().reverseKhNum(dateArray[0].toString());

    int month =
        ConstantVariables.khmerMonths.indexOf(dateArray[1], 0).toInt() + 1;

    int year = ConstantFunctions().reverseKhNum(dateArray[2]);

    latinDate = DateTime(year, month, day);

    return latinDate;
  }

  static DateTime fromLatinTime(String date) {
    return DateFormat("HH:mm").parse(date.replaceAllMapped(
      RegExp(r'[០១២៣៤៥៦៧៨៩]'),
      (match) => (int.parse(match
              .group(0)!
              .replaceAll('០', '0')
              .replaceAll('១', '1')
              .replaceAll('២', '2')
              .replaceAll('៣', '3')
              .replaceAll('៤', '4')
              .replaceAll('៥', '5')
              .replaceAll('៦', '6')
              .replaceAll('៧', '7')
              .replaceAll('៨', '8')
              .replaceAll('៩', '9')))
          .toString(),
    ));
  }
}
