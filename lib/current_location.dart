import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ScreenView extends StatefulWidget {
  double? latitude;
  double? longitude;

  ScreenView({this.latitude, this.longitude});

  void lastKnownPosition() async {
    await locationServicesStatus();
    await checkLocationPermissions();
    try {
      Position? position = await Geolocator.getLastKnownPosition();
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void locationHereIs() async {
    await locationServicesStatus();
    await checkLocationPermissions();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 28));
      print(position);
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkLocationPermissions() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print('Current Location Permission Status = $permission.');
  }

  void checkLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future<void> locationServicesStatus() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print(
        'Currently, the emulator\'s Location Services Status = $isLocationServiceEnabled.');
  }

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  @override
  void initState() {
    ScreenView().lastKnownPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}