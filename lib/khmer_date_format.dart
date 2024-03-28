import 'package:khmer_date_format/function/constant_functions.dart';

class KhmerDateFormatter {
  static String formatKhmerDate(DateTime date) {
    // Convert the date to Khmer numerals
    String? khmerDay = ConstantFunctions().getKhmerDay(date.weekday.toString());
    String? khmerDate = ConstantFunctions().convertLatinNumtoKhmerNum(date.day);
    String khmerMonth = ConstantFunctions.khmerMonths[date.month - 1];
    String? khmerYear =
        ConstantFunctions().convertLatinNumtoKhmerNum(date.year);

    return 'ថ្ងៃ$khmerDay ទី$khmerDate ខែ$khmerMonth ឆ្នាំ$khmerYear';
  }
}
