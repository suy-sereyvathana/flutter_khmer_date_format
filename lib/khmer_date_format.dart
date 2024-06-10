import 'package:khmer_date_format/constants/constant_functions.dart';

class KhmerDateFormat {
  static String formatKhmerDate(DateTime date) {
    String? khmerDay = ConstantFunctions().getKhmerDay(date);

    String? khmerDate = ConstantFunctions().convertKhString(date.day);

    String? khmerMonth =
        ConstantFunctions().getKhmerMonthByMonthNum(date.month);

    String? khmerYear = ConstantFunctions().convertKhString(date.year);

    return 'ថ្ងៃ$khmerDay ទី$khmerDate ខែ$khmerMonth ឆ្នាំ$khmerYear';
  }
}
