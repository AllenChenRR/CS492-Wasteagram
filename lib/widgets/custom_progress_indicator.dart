import 'package:flutter/material.dart';

CircularProgressIndicator customProgressIndicator() {
  return CircularProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation(Colors.red));
}
