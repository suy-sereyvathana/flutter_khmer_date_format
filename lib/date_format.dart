class DateFormat {
  String formatDate(DateTime date, {String? format}) {
    String newDay = date.day.toString();
    String newMonth = "";
    String newYear = date.year.toString();

    if (date.month < 10) {
      newMonth = "0${date.month.toString()}";
    } else {
      newMonth = date.month.toString();
    }

    String resultDate = "$newYear-$newMonth-$newDay";

    if (format == "dd-mm-yyyy") {
      resultDate = "$newDay-$newMonth-$newYear";
    } else if (format == "mm/dd/yyyy") {
      resultDate = "$newDay/$newMonth/$newYear";
    } else if (format == "yyyy/mm/dd") {
      resultDate = "$newYear/$newMonth/$newDay";
    }

    return resultDate;
  }
}
