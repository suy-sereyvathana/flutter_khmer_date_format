class ConstantFunctions {
  static List<String> khmerNumerals = [
    '០',
    '១',
    '២',
    '៣',
    '៤',
    '៥',
    '៦',
    '៧',
    '៨',
    '៩'
  ];

  // Define Khmer months
  static List<String> khmerMonths = [
    'មករា',
    'កុម្ភៈ',
    'មីនា',
    'មេសា',
    'ឧសភា',
    'មិថុនា',
    'កក្កដា',
    'សីហា',
    'កញ្ញា',
    'តុលា',
    'វិច្ឆិកា',
    'ធ្នូ'
  ];

  String? convertLatinNumtoKhmerString(int n) {
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

  int? convertLatinNumtoKhmerNum(int n) {
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

  int? convertKhmerStringToLatinNum(String n) {
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

  String? convertKhmerStringToLatinString(String n) {
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

  String? getKhmerMonthByMonthNum(int monthNum) {
    return khmerMonths[monthNum - 1];
  }

  String? getKhmerMonth(String latinMonth) {
    String d;

    switch (latinMonth.substring(0, 3).toLowerCase()) {
      case "jan":
        d = "មករា";
        break;
      case "feb":
        d = "កុម្ភៈ";
        break;
      case "mar":
        d = "មីនា";
        break;
      case "apr":
        d = "មេសា";
        break;
      case "may":
        d = "ឧសភា";
        break;
      case "jun":
        d = "មិថុនា";
        break;
      case "jul":
        d = "កក្កដា";
        break;
      case "aug":
        d = "សីហា";
        break;
      case "sep":
        d = "កញ្ញា";
        break;
      case "oct":
        d = "តុលា";
        break;
      case "nov":
        d = "វិច្ឆិកា";
        break;
      case "dec":
        d = "ធ្នូ";
        break;
      default:
        d = "Invalid month";
        break;
    }

    return d;
  }

  String? getKhmerDay(String latinDay) {
    String d;

    switch (latinDay) {
      case "1":
        d = "ចន្ទ";
        break;
      case "2":
        d = "អង្គារ";
        break;
      case "3":
        d = "ពុធ";
        break;
      case "4":
        d = "ព្រហស្បតិ៍";
        break;
      case "5":
        d = "សុក្រ";
        break;
      case "6":
        d = "សៅរ៍";
        break;
      case "7":
        d = "អាទិត្យ";
        break;
      default:
        d = "Invalid day";
        break;
    }

    return d;
  }

  String? getLatinDay(String dayNumber) {
    String d;

    switch (dayNumber) {
      case "1":
        d = "Monday";
        break;
      case "2":
        d = "Tuesday";
        break;
      case "3":
        d = "Wednesday";
        break;
      case "4":
        d = "Thursday";
        break;
      case "5":
        d = "Friday";
        break;
      case "6":
        d = "Saturday";
        break;
      case "7":
        d = "Subday";
        break;
      default:
        d = "Invalid day";
        break;
    }

    return d;
  }

  String? getLatinMonth(String monthNumber) {
    String d;

    switch (monthNumber) {
      case "1":
        d = "January";
        break;
      case "2":
        d = "February";
        break;
      case "3":
        d = "March";
        break;
      case "4":
        d = "April";
        break;
      case "5":
        d = "May";
        break;
      case "6":
        d = "June";
        break;
      case "7":
        d = "July";
        break;
      case "8":
        d = "August";
        break;
      case "9":
        d = "September";
        break;
      case "10":
        d = "October";
        break;
      case "11":
        d = "November";
        break;
      case "12":
        d = "December";
        break;
      default:
        d = "Invalid month";
        break;
    }

    return d;
  }
}
