import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';

class FoodWastePost {
  int quantity;
  DateTime date;
  String url;
  double longitude;
  double latitude;

  FoodWastePost(
      {this.quantity, this.date, this.url, this.latitude, this.longitude});

  String get weekdayDate {
    return convertToDate(Timestamp.fromDate(date));
  }

  int get count {
    return quantity;
  }

  DateTime get dateOfEntry {
    return date;
  }

  String get filePath {
    return url;
  }

  double get locationLongitude {
    return longitude;
  }

  double get locationLatitude {
    return latitude;
  }

  Map<String, dynamic> get mappedValues {
    return {
      'quantity': quantity,
      'date': date,
      'url': url,
      'location': GeoPoint(latitude, longitude)
    };
  }
}
