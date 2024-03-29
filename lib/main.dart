// export "khmer_date_format.dart";
// export "constant_functions.dart";

import 'package:khmer_date_format/date_format.dart';
import 'package:khmer_date_format/khmer_date_format.dart';

void main(List<String> args) {
  DateTime now = DateTime.now();

  print(KhmerDateFormat.formatKhmerDate(now));

  print(DateFormat().formatDate(now, format: 'dd-mm-yyyy'));
}
