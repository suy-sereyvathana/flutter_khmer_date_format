import 'package:khmer_date_format/constants/constant_variables.dart';

class ConstantFunctions {
  /// ```
  ///
  /// Required Integer parameter
  /// Example: convertKhString(1)
  /// Result: ១
  /// ```
  String convertKhString(int n) {
    String numString = n.toString();

    numString = numString.replaceAll('0', '០');
    numString = numString.replaceAll('1', '១');
    numString = numString.replaceAll('2', '២');
    numString = numString.replaceAll('3', '៣');
    numString = numString.replaceAll('4', '៤');
    numString = numString.replaceAll('5', '៥');
    numString = numString.replaceAll('6', '៦');
    numString = numString.replaceAll('7', '៧');
    numString = numString.replaceAll('8', '៨');
    numString = numString.replaceAll('9', '៩');

    return numString;
  }

  int converToKhNum(int n) {
    String num = n.toString();

    num = num.replaceAll('0', '០');
    num = num.replaceAll('1', '១');
    num = num.replaceAll('2', '២');
    num = num.replaceAll('3', '៣');
    num = num.replaceAll('4', '៤');
    num = num.replaceAll('5', '៥');
    num = num.replaceAll('6', '៦');
    num = num.replaceAll('7', '៧');
    num = num.replaceAll('8', '៨');
    num = num.replaceAll('9', '៩');

    return int.parse(num);
  }

  /// ```
  ///
  /// Required String parameter
  /// Example: reverseKhNum("១")
  /// Result: 1
  /// ```
  int reverseKhNum(String n) {
    n = n.replaceAll('០', "0");
    n = n.replaceAll('១', "1");
    n = n.replaceAll('២', "2");
    n = n.replaceAll('៣', "3");
    n = n.replaceAll('៤', "4");
    n = n.replaceAll('៥', "5");
    n = n.replaceAll('៦', "6");
    n = n.replaceAll('៧', "7");
    n = n.replaceAll('៨', "8");
    n = n.replaceAll('៩', "9");

    return int.parse(n);
  }

  String reverseKhString(String n) {
    n = n.replaceAll('០', "0");
    n = n.replaceAll('១', "1");
    n = n.replaceAll('២', "2");
    n = n.replaceAll('៣', "3");
    n = n.replaceAll('៤', "4");
    n = n.replaceAll('៥', "5");
    n = n.replaceAll('៦', "6");
    n = n.replaceAll('៧', "7");
    n = n.replaceAll('៨', "8");
    n = n.replaceAll('៩', "9");

    return n;
  }

  String getKhmerMonthByMonthNum(int monthNum) {
    return ConstantVariables.khmerMonths[monthNum - 1];
  }

  String getKhmerMonth(DateTime date) {
    switch (date.month - 1) {
      case 0:
        return "មករា";
      case 1:
        return "កុម្ភៈ";
      case 2:
        return "មីនា";
      case 3:
        return "មេសា";
      case 4:
        return "ឧសភា";
      case 5:
        return "មិថុនា";
      case 6:
        return "កក្ដដា";
      case 7:
        return "សីហា";
      case 8:
        return "កញ្ញា";
      case 9:
        return "តុលា";
      case 10:
        return "វិច្ឆិកា";
      case 11:
        return "ធ្នូ";
      default:
        return "invalid weekday";
    }
  }

  String getKhmerDay(DateTime date, {isShort = false}) {
    switch (date.weekday) {
      case 1:
        return isShort ? "ចន្ទ" : "ចន្ទ";
      case 2:
        return isShort ? "អង្គ" : "អង្គារ៍";
      case 3:
        return isShort ? "ពុធ" : "ពុធ";
      case 4:
        return isShort ? "ព្រហ" : "ព្រហស្បតិ៍";
      case 5:
        return isShort ? "សុក្រ" : "សុក្រ";
      case 6:
        return isShort ? "សៅរ៍" : "សៅរ៍";
      case 7:
        return isShort ? "អាទិ" : "អាទិត្យ";
      default:
        return "invalid weekday";
    }
  }

  String getLatinDay(DateTime date, {isShort = false}) {
    switch (date.weekday) {
      case 1:
        return isShort ? "Mon" : "Monday";
      case 2:
        return isShort ? "Tue" : "Tuesday";
      case 3:
        return isShort ? "Wed" : "Wednesday";
      case 4:
        return isShort ? "Thu" : "Thursday";
      case 5:
        return isShort ? "Fri" : "Friday";
      case 6:
        return isShort ? "Sat" : "Saturday";
      case 7:
        return isShort ? "Sun" : "Sunday";
      default:
        return "invalid weekday";
    }
  }

  // String monthNumber should be int
  String getLatinMonth(DateTime date, {isShort = false}) {
    switch (date.month - 1) {
      case 0:
        return isShort ? "Jan" : "January";
      case 1:
        return isShort ? "Feb" : "February";
      case 2:
        return isShort ? "Mar" : "March";
      case 3:
        return isShort ? "Apr" : "Apirl";
      case 4:
        return isShort ? "May" : "May";
      case 5:
        return isShort ? "Jun" : "June";
      case 6:
        return isShort ? "Jul" : "July";
      case 7:
        return isShort ? "Aug" : "August";
      case 8:
        return isShort ? "Sep" : "September";
      case 9:
        return isShort ? "Oct" : "October";
      case 10:
        return isShort ? "Nov" : "November";
      case 11:
        return isShort ? "Dec" : "December";
      default:
        return "invalid weekday";
    }
  }
}
