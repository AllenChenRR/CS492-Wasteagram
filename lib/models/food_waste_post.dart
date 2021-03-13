import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';

class FoodWastePost {
  int quantity;
  DateTime date;
  String url;
  double longitude;
  double latitude;

  FoodWastePost(
      {this.quantity, this.url, this.date, this.latitude, this.longitude});

  String get weekdayDate {
    return convertToShortDate(Timestamp.fromDate(date));
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

  String get path {
    return url;
  }

  set path(String pathUrl) {
    this.url = pathUrl;
  }

  Map<String, dynamic> get mappedValues {
    return {
      'quantity': quantity,
      'date': date,
      'url': url,
      'location': GeoPoint(latitude, longitude)
    };
  }

  String toString() {
    return 'quantity: $quantity, date: $date, url: $url, longitude: $longitude, latitude: $latitude';
  }
}
