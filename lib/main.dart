import 'package:khmer_date_format/moment_kh.dart';

export "khmer_date_format.dart";
export "constants/constant_functions.dart";

void main(List<String> args) {
  DateTime date = new DateTime.now();

  print(MomentKH.getKhmerLunarString(date));
}
