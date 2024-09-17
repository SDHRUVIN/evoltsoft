import 'package:intl/intl.dart';

class Utils {
  static Future<bool> isInternetAvailable() async {
    /*var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }*/
    return true;
  }

  static bool get10MinutesDifference(String startTime) {
    DateTime date1 = DateTime.fromMillisecondsSinceEpoch(
        int.parse(startTime) * 1000); // Replace with your first date
    DateTime date2 = DateTime.now(); // Replace with your second date

    Duration difference = date2.difference(date1);
    return difference.inMinutes <= 10;
  }

  static String fetchFormattedDateMMMDD(String ym) {
    //
    String inputDate = ym ?? "2024-03-05 18:49:07";

    // Parse the input date string
    DateTime date = DateTime.parse(inputDate);

    // Format the date using DateFormat
    String formattedDate = DateFormat("MMM-dd").format(date);

    return formattedDate;
  }

  static String fetchFormattedDateEEE(String ym) {
    //
    String inputDate = ym ?? "2024-03-05 18:49:07";

    // Parse the input date string
    DateTime date = DateTime.parse(inputDate);

    // Format the date using DateFormat
    String formattedDate = DateFormat("EEE").format(date);

    return formattedDate;
  }

  static String fetchFormattedDateMMMDDYYYY(String ym) {
    //
    String inputDate = ym.length > 11
        ? ym
        : "$ym 00:00:00".replaceAll(".", "-") ?? "2024-01-01 00:00:00";

    // Parse the input date string
    DateTime date = DateTime.parse(inputDate);

    // Format the date using DateFormat
    String formattedDate = DateFormat("MMM dd, yyyy").format(date);

    return formattedDate;
  }

  int reverseConvertNumber(int number) {
    double reverse = (0 == number ? 0 : number - 1) / 12;
    return reverse.isFinite ? reverse.toInt() : 0;
  }

  int convertNumber(int number) {
    int no = 0 == number ? 0 : number;
    return (no * 12) + 1;
  }
}
