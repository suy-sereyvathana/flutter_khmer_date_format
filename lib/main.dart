import 'package:khmer_date_format/latin_date_format.dart';
import 'package:khmer_date_format/moment_kh.dart';

export "khmer_date_format.dart";
export "constants/constant_functions.dart";

void main(List<String> args) {
  String date = "១០:២៦";
  print(LatinDateFormat.fromLatinTime(date));
}
