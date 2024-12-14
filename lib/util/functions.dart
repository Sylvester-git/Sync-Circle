import '../package_barrel.dart';

String greeting() {
  if (DateTime.now().hour >= 12 && DateTime.now().hour <= 16) {
    return 'Good Afternoon';
  }
  if (DateTime.now().hour >= 6 && DateTime.now().hour < 12) {
    return 'Good Morning';
  }
  return 'Good Evening';
}

String getWordBeforeSpace(String input) {
  // Find the last space in the string
  int spaceIndex = input.lastIndexOf(' ');

  // Check if a space exists
  if (spaceIndex == -1) {
    return "";
  }

  // Extract the word before the last space
  String wordBefore = input.substring(0, spaceIndex).split(' ').last;

  return wordBefore;
}

String formatDateToMonthYear(DateTime date) {
  // Use the intl package's DateFormat to format the date
  final DateFormat formatter = DateFormat('MMMM-yyyy');
  return formatter.format(date);
}

String formatDateToAmPm(DateTime date) {
  // Use the intl package's DateFormat to format the time from AM to PM
  final DateFormat formatter = DateFormat('h a');
  return formatter.format(date);
}
