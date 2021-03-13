import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models.dart';

void main() {
  final date = DateTime.parse("1969-07-20 20:18:04Z");
  final quantity = 153153;
  final url = 'Google.com';
  final longitude = -100.1;
  final latitude = 100.2;

  test(
      'WastePost instance created from instantiation should return proper date with day of the week and month truncated to first three letters',
      () {
    final food_waste_post = FoodWastePost(
        date: date,
        quantity: quantity,
        url: url,
        longitude: longitude,
        latitude: latitude);

    String weekdayDate = food_waste_post.weekdayDate;

    expect(weekdayDate, 'Sun, Jul 20, 1969');
  });

  test(
      'Properly sets the url after FoodWastePost has already been instantiated',
      () {
    final food_waste_post = FoodWastePost(
        date: date,
        quantity: quantity,
        longitude: longitude,
        latitude: latitude);

    food_waste_post.path = 'youtube.com';

    expect(food_waste_post.path, 'youtube.com');
  });
}
