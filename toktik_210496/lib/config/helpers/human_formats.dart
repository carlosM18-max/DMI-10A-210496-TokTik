import 'package:intl/intl.dart';

class HumanFormats {
  // Transforma los numeros a MK
  static String humanReadbleNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}
