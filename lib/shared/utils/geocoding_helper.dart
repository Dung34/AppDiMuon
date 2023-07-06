import 'dart:developer';

import 'package:location/location.dart' as locationing;
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class GeocodingHelper {
  locationing.Location location = locationing.Location();

  Future<CurrentLocation> getCurrentLocation() async {
    if (await requestGPSPermission()) {
      final locationing.LocationData locationData =
          await location.getLocation();
      String address = await getAddressFromCoordinate(
          locationData.latitude ?? 0, locationData.longitude ?? 0);
      return CurrentLocation(
          lat: locationData.latitude ?? 0,
          long: locationData.longitude ?? 0,
          address: address);
    }

    return CurrentLocation(lat: 0, long: 0, address: '');
  }

  Future<CurrentCoordinate> getCurrentCoordinate() async {
    if (await requestGPSPermission()) {
      final locationing.LocationData locationData =
          await location.getLocation();

      return CurrentCoordinate(
        lat: locationData.latitude ?? 0,
        long: locationData.longitude ?? 0,
      );
    }

    return CurrentCoordinate(lat: 0, long: 0);
  }

  Future<bool> requestGPSPermission() async {
    bool serviceEnabled;
    locationing.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    permissionGranted = await location.hasPermission();
    log('permissionGranted $permissionGranted');

    if (permissionGranted == locationing.PermissionStatus.denied ||
        permissionGranted == locationing.PermissionStatus.deniedForever) {
      permissionGranted = await location.requestPermission();
      log('permissionGranted2 $permissionGranted');
      if (permissionGranted != locationing.PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<bool> openAppSetting() async {
    locationing.PermissionStatus permissionGranted;
    await openAppSettings();
    permissionGranted = await location.requestPermission();
    log('permissionGranted3 $permissionGranted');
    if (permissionGranted != locationing.PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  Future<String> getAddressFromCoordinate(double lat, double lang) async {
    String address = "";
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(lat, lang);
    if (placemarks.isNotEmpty) {
      // use the last place in placeList returned from the same coordinate.
      final Placemark placemark = placemarks[placemarks.length - 1];
      address =
          '${placemark.street}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}';
    }
    return address;
  }
}

class CurrentLocation {
  final double lat;
  final double long;
  final String address;

  CurrentLocation(
      {required this.lat, required this.long, required this.address});
}

class CurrentCoordinate {
  final double lat;
  final double long;

  CurrentCoordinate({required this.lat, required this.long});
}
