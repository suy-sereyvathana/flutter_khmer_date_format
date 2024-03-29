import 'package:khmer_date_format/constant_functions.dart';

class KhmerDateFormat {
  static String formatKhmerDate(DateTime date) {
    String? khmerDay = ConstantFunctions().getKhmerDay(date.weekday.toString());
    String? khmerDate =
        ConstantFunctions().convertLatinNumtoKhmerString(date.day);
    String? khmerMonth =
        ConstantFunctions().getKhmerMonthByMonthNum(date.month);
    String? khmerYear =
        ConstantFunctions().convertLatinNumtoKhmerString(date.year);

    return 'ថ្ងៃ$khmerDay ទី$khmerDate ខែ$khmerMonth ឆ្នាំ$khmerYear';
  }
}
