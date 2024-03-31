// ignore_for_file: slash_for_doc_comments

import 'package:khmer_date_format/constants/constant_variables.dart';

/**
 * @see http://www.dahlina.com/education/khmer_new_year_time.html?fbclid=IwAR0Eq6US-F0LfplMjKzmiRn7rvPgi31i74Wpv4mNhU034mzdyj-3hYrCA8w
 * @param jsYear
 * @returns {{harkun, kromathopol, avaman, bodithey, has366day: *, isAthikameas: *, isChantreathimeas: *, jesthHas30: *, dayLerngSak: number, lunarDateLerngSak: {day: number, month: *}}}
 */
Map<String, dynamic> getSoriyatraLerngSak(int jsYear) {
  /**
   * គណនា ហារគុន Kromathopol អវមាន និង បូតិថី
   * @param jsYear
   * @returns {{bodithey: number, avaman: number, kromathopol: number, harkun: number}}
   */
  Map<String, int> getInfo(int jsYear) {
    jsYear = jsYear + 544;
    int h = ((jsYear * 292207) + 373);
    var harkun = (h / 800).round() + 1;
    int kromathopol = (800 - (h % 800));

    var a = 11 * harkun + 650;
    var avaman = a % 692;
    var bodithey = (harkun + (a / 692).round()) % 30;

    return {
      "harkun": harkun,
      "kromathopol": kromathopol,
      "avaman": avaman,
      "bodithey": bodithey
    };
  }

  Map<String, int> info = getInfo(jsYear);

  /**
   * ឆ្នាំចុល្លសករាជដែលមាន៣៦៦ថ្ងៃ
   * @param jsYear
   * @returns {boolean}
   */
  bool getHas366day(int jsYear) {
    Map<String, int> infoOfYear = getInfo(jsYear);
    return infoOfYear['kromathopol']! <= 207;
  }

  /**
   * រកឆ្នាំអធិកមាស
   * @param jsYear
   * @returns {boolean}
   */
  bool getIsAthikameas(int jsYear) {
    Map<String, int> infoOfYear = getInfo(jsYear);
    Map<String, int> infoOfNextYear = getInfo(jsYear + 1);
    return (!(infoOfYear['bodithey'] == 25 &&
            infoOfNextYear['bodithey'] == 5) &&
        (infoOfYear['bodithey']! > 24 ||
            infoOfYear['bodithey']! < 6 ||
            (infoOfYear['bodithey'] == 24 && infoOfNextYear['bodithey'] == 6)));
  }

  /**
   * រកឆ្នាំចន្ទ្រាធិមាស
   * @param jsYear
   * @returns {boolean}
   */
  bool getIsChantreathimeas(int jsYear) {
    Map<String, int> infoOfYear = getInfo(jsYear);
    Map<String, int> infoOfNextYear = getInfo(jsYear + 1);
    Map<String, int> infoOfPreviousYear = getInfo(jsYear - 1);
    bool has366day = getHas366day(jsYear);
    return ((has366day && infoOfYear['avaman']! < 127) ||
        (!(infoOfYear['avaman'] == 137 && infoOfNextYear['avaman'] == 0) &&
            ((!has366day && infoOfYear['avaman']! < 138) ||
                (infoOfPreviousYear['avaman'] == 137 &&
                    infoOfYear['avaman'] == 0))));
  }

  bool has366day = getHas366day(jsYear);
  bool isAthikameas = getIsAthikameas(jsYear);
  bool isChantreathimeas = getIsChantreathimeas(jsYear);

  /**
   * ឆែកមើលថាជាឆ្នាំដែលខែជេស្ឋមាន៣០ថ្ងៃឬទេ
   * @type {boolean}
   */
  bool jesthHas30 = (() {
    bool tmp = isChantreathimeas;
    if (isAthikameas && isChantreathimeas) {
      tmp = false;
    }
    if (!isChantreathimeas &&
        getIsAthikameas(jsYear - 1) &&
        getIsChantreathimeas(jsYear - 1)) {
      tmp = true;
    }
    return tmp;
  })();

  /**
   * រកមើលថាតើថ្ងៃឡើងស័កចំថ្ងៃអ្វី
   * @type {number}
   */
  int dayLerngSak = (info['harkun']! - 2) % 7;

  /**
   * គណនារកថ្ងៃឡើងស័ក
   * @type {{month, day}}
   */
  Map<String, dynamic> lunarDateLerngSak = (() {
    int bodithey = info['bodithey']!;
    if (getIsAthikameas(jsYear - 1) && getIsChantreathimeas(jsYear - 1)) {
      bodithey = (bodithey + 1) % 30;
    }
    return {
      'day': bodithey >= 6 ? bodithey - 1 : bodithey,
      'month': bodithey >= 6
          ? ConstantVariables.khmerMonths[5]
          : ConstantVariables.khmerMonths[6],
    };
  })();

  Map<String, dynamic> getSunInfo(int sotin) {
    Map<String, int> infoOfPreviousYear = getInfo(jsYear - 1);
    // ១ រាសី = ៣០ អង្សា
    // ១ អង្សា = ៦០ លិប្ដា
    int sunAverageAsLibda = (() {
      int r2 = 800 * sotin + infoOfPreviousYear['kromathopol']!;
      int reasey = (r2 ~/ 24350); // រាសី
      int r3 = r2 % 24350;
      int angsar = (r3 ~/ 811); // អង្សា
      int r4 = r3 % 811;
      int l1 = (r4 ~/ 14);
      int libda = l1 - 3; // លិប្ដា
      return (30 * 60 * reasey) + (60 * angsar) + libda;
    })();

    int leftOver = (() {
      int s1 = ((30 * 60 * 2) + (60 * 20));
      int leftOver = sunAverageAsLibda - s1; // មធ្យមព្រះអាទិត្យ - R2.A20.L0
      if (sunAverageAsLibda < s1) {
        // បើតូចជាង ខ្ចី ១២ រាសី
        leftOver += (30 * 60 * 12);
      }
      return leftOver;
    })();

    int kaen = (() {
      return (leftOver ~/ (30 * 60));
    })();

    Map<String, int> lastLeftOver = (() {
      int rs = -1;
      if ([0, 1, 2].contains(kaen)) {
        rs = kaen;
      } else if ([3, 4, 5].contains(kaen)) {
        rs = (30 * 60 * 6) - leftOver; // R6.A0.L0 - leftover
      } else if ([6, 7, 8].contains(kaen)) {
        rs = leftOver - (30 * 60 * 6); // leftover - R6.A0.L0
      } else if ([9, 10, 11].contains(kaen)) {
        rs = ((30 * 60 * 11) + (60 * 29) + 60) -
            leftOver; // R11.A29.L60 - leftover
      }
      return {
        'reasey': (rs ~/ (30 * 60)),
        'angsar': ((rs % (30 * 60)) ~/ (60)),
        'libda': rs % 60,
      };
    })();

    List<int> khanPouichalip = (() {
      if (lastLeftOver['angsar']! >= 15) {
        return [
          2 * lastLeftOver['reasey']! + 1,
          60 * (lastLeftOver['angsar']! - 15) + lastLeftOver['libda']!,
        ];
      } else {
        return [
          2 * lastLeftOver['reasey']!,
          60 * lastLeftOver['angsar']! + lastLeftOver['libda']!,
        ];
      }
    })();

    Map<String, int> phol = (() {
      Map<String, int> chhayaSun(int khan) {
        List<int> multiplicities = [35, 32, 27, 22, 13, 5];
        List<int> chhayas = [0, 35, 67, 94, 116, 129];
        switch (khan) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
            return {
              'multiplicity': multiplicities[khan],
              'chhaya': chhayas[khan],
            };
          default:
            return {
              'chhaya': 134,
            };
        }
      }

      Map<String, int> val = chhayaSun(khanPouichalip[0]);
      int q = ((khanPouichalip[1] * val['multiplicity']!) ~/ 900);
      return {
        'reasey': 0,
        'angsar': ((q + val['chhaya']!) ~/ 60),
        'libda': (q + val['chhaya']!) % 60,
      };
    })();

    int sunInaugurationAsLibda = (() {
      int pholAsLibda =
          (30 * 60 * phol['reasey']!) + (60 * phol['angsar']!) + phol['libda']!;
      if (kaen <= 5) {
        return sunAverageAsLibda - pholAsLibda;
      } else {
        return sunAverageAsLibda + pholAsLibda;
      }
    })();

    return {
      'sunAverageAsLibda': sunAverageAsLibda,
      'khan': khanPouichalip[0],
      'pouichalip': khanPouichalip[1],
      'phol': phol,
      'sunInaugurationAsLibda': sunInaugurationAsLibda,
    };
  }

  List<Map<String, dynamic>> newYearsDaySotins = (() {
    List<int> sotins = getHas366day(jsYear - 1)
        ? [363, 364, 365, 366]
        : [362, 363, 364, 365]; // សុទិន
    return sotins.map((sotin) {
      Map<String, dynamic> sunInfo = getSunInfo(sotin);
      return {
        'sotin': sotin,
        'reasey': (sunInfo['sunInaugurationAsLibda'] ~/ (30 * 60)),
        'angsar': ((sunInfo['sunInaugurationAsLibda'] % (30 * 60)) ~/
            (60)), // អង្សាស្មើសូន្យ គីជាថ្ងៃចូលឆ្នាំ, មួយ ឬ ពីរ ថ្ងៃបន្ទាប់ជាថ្ងៃវ័នបត ហើយ ថ្ងៃចុងក្រោយគីឡើងស័ក
        'libda': sunInfo['sunInaugurationAsLibda'] % 60,
      };
    }).toList();
  })();

  Map<String, int> timeOfNewYear = (() {
    List<Map<String, dynamic>> sotinNewYear = newYearsDaySotins.where((sotin) {
      return sotin['angsar'] == 0;
    }).toList();
    if (sotinNewYear.isNotEmpty) {
      int libda = sotinNewYear[0]['libda']; // ២៤ ម៉ោង មាន ៦០លិប្ដា
      int minutes = (24 * 60) - (libda * 24);
      return {
        'hour': minutes ~/ 60,
        'minute': minutes % 60,
      };
    } else {
      throw Error();
    }
  })();

  return {
    'harkun': info['harkun'],
    'kromathopol': info['kromathopol'],
    'avaman': info['avaman'],
    'bodithey': info['bodithey'],
    'has366day': has366day, // សុរិយគតិខ្មែរ
    'isAthikameas': isAthikameas, // 13 months
    'isChantreathimeas': isChantreathimeas, // 30ថ្ងៃនៅខែជេស្ឋ
    'jesthHas30': jesthHas30, // ខែជេស្ឋមាន៣០ថ្ងៃ
    'dayLerngSak': dayLerngSak, // ថ្ងៃឡើងស័ក ច័ន្ទ អង្គារ ...
    'lunarDateLerngSak': lunarDateLerngSak, // ថ្ងៃទី ខែ ឡើងស័ក
    'newYearsDaySotins':
        newYearsDaySotins, // សុទិនសម្រាប់គណនាថ្ងៃចូលឆ្នាំ ថ្ងៃវ័នបត និង ថ្ងៃឡើងស័ក
    'timeOfNewYear': timeOfNewYear, // ម៉ោងទេវតាចុះ
  };
}
