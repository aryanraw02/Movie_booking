/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-12-20 14:32:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

/// Extension on [Duration] to format it as a string in "HHh mm" format.
/// For example, a duration of 1 hour and 34 minutes becomes "01h 34m".
extension HHmm on Duration {
  /// Formats the Duration object to a string with hours and minutes.
  String formatHHmm() {
    // Convert the Duration to its default string representation.
    // Example output: "1:34:00.000000"
    final str = toString();

    // Split the string by ":" to separate hours, minutes, etc.
    final texts = str.split(":");
    // Pad the hour part with a leading zero if necessary to ensure two digits.
    final textHour = texts[0].padLeft(2, '0');
    // Pad the minute part with a leading zero if necessary to ensure two digits.
    final textMinute = texts[1].padLeft(2, '0');

    // Return the formatted string in the form "HHh mm".
    return "${textHour}h ${textMinute}m";
  }
}

/// Extension on [int] to format numbers with a thousand separator.
/// For example, 2025 is formatted as "2,025".
extension FormatNumber on int {
  /// Formats the integer using a decimal pattern for the en_US locale.
  String formatDecimalThousand() {
    // Create a NumberFormat instance with comma as the thousand separator.
    var f = NumberFormat.decimalPattern("en_US");
    // Format the integer and return the resulting string.
    return f.format(this);
  }
}

/// Extension on [int] to format a Unix timestamp into a human-readable date string.
/// Assumes the integer represents a Unix timestamp (in seconds).
extension FormatDate on int {
  /// Converts the Unix timestamp (in seconds) to a formatted date string "MMM dd, yyyy".
  String MMM_dd_yyyy() {
    // Multiply by 1000 to convert seconds to milliseconds,
    // then create a DateTime object and format it.
    return DateFormat(
      "MMM dd, yyyy",
    ).format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}
