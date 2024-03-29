Hello from Suy Sereyvathana

Install this package by: flutter pub add khmer_date_format

How to use:

    # KhmerDate Format
    
    import 'package:khmer_date_format/main.dart';

    DateTime now = DateTime.now();

    print(KhmerDateFormatter.formatKhmerDate(now));

    # Example: ថ្ងៃចន្ទ ទី០១ ខែមករា ឆ្នាំ២០២៤


    # Date Format

    import 'package:khmer_date_format/date_format.dart';

    DateTime now = DateTime.now();

    print(DateFormat().formatDate(now));

    # Example: 2024-01-01

    print(DateFormat().formatDate(now, format: 'dd-mm-yyyy'));

    # Example: 01-01-2024


