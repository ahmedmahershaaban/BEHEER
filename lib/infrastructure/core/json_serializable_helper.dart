import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// Helper Function that convert to and from `FirebaseFirestore.TimeStamp` <-> `DateTime`.
class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic value) {
    if (value is Timestamp) {
      return value.toDate().toLocal();
    }
    throw UnsupportedError('This Type of data is not supported');
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
