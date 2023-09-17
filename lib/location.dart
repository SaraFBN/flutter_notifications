import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocation {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        longitude = position.longitude;
        latitude = position.latitude;

        print(latitude);
        print(longitude);
      } else {
        // Handle the case when permission is denied
        print("Location permission denied");
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
