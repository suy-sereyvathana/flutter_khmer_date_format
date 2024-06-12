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
  static DateTime fromLatinTime(String date){
    date = date.replaceAll('០', "0");
    date = date.replaceAll('១', "1");
    date = date.replaceAll('២', "2");
    date = date.replaceAll('៣', "3");
    date = date.replaceAll('៤', "4");
    date = date.replaceAll('៥', "5");
    date = date.replaceAll('៦', "6");
    date = date.replaceAll('៧', "7");
    date = date.replaceAll('៨', "8");
    date = date.replaceAll('៩', "9");
    return DateFormat("HH:mm").parse(date);
  }
}
