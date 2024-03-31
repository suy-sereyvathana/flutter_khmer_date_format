import 'package:khmer_date_format/enums/date_format_enum.dart';

class DateFormat {
  String formatDate(DateTime date,
      {DateFormatEnum? format, String? seperate = "-"}) {
    String newDay = date.day.toString();
    String newMonth = "";
    String newYear = date.year.toString();

    if (date.month < 10) {
      newMonth = "0${date.month.toString()}";
    } else {
      newMonth = date.month.toString();
    }

    String resultDate = "$newYear-$newMonth-$newDay";

    if (format == DateFormatEnum.DDMMYYYY && seperate == "-") {
      resultDate = "$newDay-$newMonth-$newYear";
    } else if (format == DateFormatEnum.DDMMYYYY && seperate == "/") {
      resultDate = "$newDay/$newMonth/$newYear";
    } else if (format == "mm/dd/yyyy") {
      resultDate = "$newDay/$newMonth/$newYear";
    } else if (format == "yyyy/mm/dd") {
      resultDate = "$newYear/$newMonth/$newDay";
    }

    return resultDate;
  }
}
