import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

double distanceBetweenCoordinatesInMeters(
  LatLng firstCoordinate,
  LatLng secondCoordinate,
) {
  return getDistanceInKilometers(firstCoordinate, secondCoordinate) * 1000;
}

double getDistanceInKilometers(
  LatLng firstCoordinate,
  LatLng secondCoordinate,
) {
  const p = pi / 180;

  final lat1 = firstCoordinate.latitude;
  final lat2 = secondCoordinate.latitude;
  final lon1 = firstCoordinate.longitude;
  final lon2 = secondCoordinate.longitude;

  final a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
