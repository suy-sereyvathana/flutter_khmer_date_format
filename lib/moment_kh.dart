import 'package:khmer_date_format/constants/constant_variables.dart';

class MomentKH {
  static Map<String, dynamic> getKhmerLunarString(DateTime date) {
    List<String> hsMonth = ConstantVariables.khmerMonths;
    List<String> hsAnimalYear = ConstantVariables.animalYears;
    List<String> hsSak = ConstantVariables.eraYear;

    print(date.day);

    String moonStatus = getMoonStatus(1);

    return {"moonStatus": moonStatus};
  }

  static getMoonStatus(day) {
    return day > 14
        ? ConstantVariables.moonStatus[1]
        : ConstantVariables.moonStatus[0];
  }
}
