import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String getTimeAgo(dynamic postDateInput) {
  try {
    if (postDateInput is DateTime) {
// If already DateTime (e.g., from Firestore Timestamp)
      return timeago.format(postDateInput);
    } else if (postDateInput is String) {
// Try Format 1: "12 Jun 2025 01:33 AM"
      try {
        final format1 = DateFormat('dd MMM yyyy hh:mm a');
        final parsedDate = format1.parse(postDateInput);
        return timeago.format(parsedDate);
      } catch (e1) {
// Try Format 2: "13 June 2025 at 23:22:38 UTC+5"
        try {
          final cleaned = postDateInput
              .replaceAll('at', '')
              .replaceAll(RegExp(r'UTC.*'), '')
              .trim();
          final format2 = DateFormat('dd MMMM yyyy HH:mm:ss');
          final parsedDate = format2.parse(cleaned);
          return timeago.format(parsedDate);
        } catch (e2) {
          return 'Invalid date';
        }
      }
    } else {
      return 'Invalid input type';
    }
  } catch (e) {
    return 'Error: ${e.toString()}';
  }
}