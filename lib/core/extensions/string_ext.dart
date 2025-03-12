import 'package:intl/intl.dart';

extension DateTimeFormatter on String {
  String toFormattedDate() {
    try {
      DateTime parsedDate = DateTime.parse(this);

      // Jika tanggal default (0001-01-01), kembalikan string kosong
      // if (parsedDate.year == 1) return "";

      return DateFormat('dd MMM yyyy, HH:mm').format(parsedDate);
    } catch (e) {
      return "Invalid date";
    }
  }
}
