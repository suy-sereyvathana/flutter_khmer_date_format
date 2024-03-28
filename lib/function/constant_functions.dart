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

  String? convertLatinNumtoKhmerNum(int n) {
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

  String? getKhmerMonth(String latinMonth) {
    String newMonth;

    switch (latinMonth.substring(0, 3).toLowerCase()) {
      case "jan":
        newMonth = "មករា";
        break;
      case "feb":
        newMonth = "កុម្ភៈ";
        break;
      case "mar":
        newMonth = "មីនា";
        break;
      case "apr":
        newMonth = "មេសា";
        break;
      case "may":
        newMonth = "ឧសភា";
        break;
      case "jun":
        newMonth = "មិថុនា";
        break;
      case "jul":
        newMonth = "កក្កដា";
        break;
      case "aug":
        newMonth = "សីហា";
        break;
      case "sep":
        newMonth = "កញ្ញា";
        break;
      case "oct":
        newMonth = "តុលា";
        break;
      case "nov":
        newMonth = "វិច្ឆិកា";
        break;
      case "dec":
        newMonth = "ធ្នូ";
        break;
      default:
        newMonth = "Invalid month";
        break;
    }

    return newMonth;
  }

  String? getKhmerDay(String latinDay) {
    String newDay;

    switch (latinDay) {
      case "1":
        newDay = "ចន្ទ";
        break;
      case "2":
        newDay = "អង្គារ";
        break;
      case "3":
        newDay = "ពុធ";
        break;
      case "4":
        newDay = "ព្រហស្បតិ៍";
        break;
      case "5":
        newDay = "សុក្រ";
        break;
      case "6":
        newDay = "សៅរ៍";
        break;
      case "7":
        newDay = "អាទិត្យ";
        break;
      default:
        newDay = "Invalid month";
        break;
    }

    return newDay;
  }
}
