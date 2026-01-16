import 'package:intl/intl.dart';

String formatRupiah(int number) {
  final currencyFomatter = NumberFormat.currency(
    locale: 'id_ID', 
    symbol: 'Rp ', 
    decimalDigits: 0);

  return currencyFomatter.format(number);
}