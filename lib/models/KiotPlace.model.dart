import 'package:google_maps_flutter/google_maps_flutter.dart';

class KiotPlace {
  final int id;
  final String name;
  final LatLng location;
  final String? image;

  KiotPlace(
      {required this.id,
      required this.name,
      required this.location,
      this.image});
}
