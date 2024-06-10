import 'package:khmer_date_format/latin_date_format.dart';
import 'package:khmer_date_format/moment_kh.dart';

export "khmer_date_format.dart";
export "constants/constant_functions.dart";

void main(List<String> args) {
  DateTime date = new DateTime.now();
  DateTime newdate = LatinDateFormat.latinFormat('១៧-ឧសភា-២០២៤');
  int year = newdate.year;
  int month = newdate.month;
  int day = newdate.day;
  print(year);
  print(month);
  print(day);
  print(newdate);
}
