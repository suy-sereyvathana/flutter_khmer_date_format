Hello from Suy Sereyvathana


How to use:

    # KhmerDate Format
    
    import 'package:khmer_date_format/main.dart';

    DateTime now = DateTime.now();

    print(KhmerDateFormat.formatKhmerDate(now));

    # Example: ថ្ងៃចន្ទ ទី០១ ខែមករា ឆ្នាំ២០២៤


    # Date Format

    import 'package:khmer_date_format/date_format.dart';
    import 'package:khmer_date_format/enums/date_format_enum.dart';

    DateTime now = DateTime.now();

    print(DateFormat().formatDate(now));

    # Example: 2024-01-01

    print(DateFormat().formatDate(now, format: DateFormatEnum.DDMMYYYY));

    # Example: 01-01-2024


