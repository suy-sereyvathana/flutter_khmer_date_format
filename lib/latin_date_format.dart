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
}
