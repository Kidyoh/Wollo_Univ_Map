import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  static LatLng getLatLngFromPosition(Position position) {
    return LatLng(position.latitude, position.longitude);
  }

  static String getDistance(double distance) {
    return "${(distance / 1000).roundToDouble()} km";
  }

  static String getDuration(dynamic duration) {
    return "${(duration / 60).round()} min";
  }

  static LatLngBounds getLatLngBounds(LatLng startPoint, LatLng endPoint) {
    LatLngBounds latLngBounds;
    if (startPoint.latitude > endPoint.latitude &&
        startPoint.longitude > endPoint.longitude) {
      latLngBounds = LatLngBounds(southwest: endPoint, northeast: startPoint);
    } else if (startPoint.latitude > endPoint.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(endPoint.latitude, startPoint.longitude),
          northeast: LatLng(startPoint.latitude, endPoint.longitude));
    } else if (startPoint.longitude > endPoint.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(startPoint.latitude, endPoint.longitude),
          northeast: LatLng(endPoint.latitude, startPoint.longitude));
    } else {
      latLngBounds = LatLngBounds(southwest: startPoint, northeast: endPoint);
    }

    return latLngBounds;
  }
}
