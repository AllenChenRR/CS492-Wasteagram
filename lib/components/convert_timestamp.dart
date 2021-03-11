import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String convertToDate(Timestamp time) {
  return DateFormat('EEEE, MMM d, yyyy').format(time.toDate()).toString();
}
