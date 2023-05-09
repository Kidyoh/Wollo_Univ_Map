// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiot_map/utils/toast_utils.dart';
import 'package:http/http.dart' as http;
import 'package:kiot_map/views/enable-location_screen.dart';
import 'package:permission_handler/permission_handler.dart';

const double DEFAULT_CAMERA_ZOOM = 16.5;
const double DEFAULT_CAMERA_TILT = 0;
const double DEFAULT_CAMERA_BEARNING = 0;

class MapService {
  final int gpsTimelimit = 60;

  static const String MAP_KEY = "AIzaSyC1w79x5ML57Z2yVlqIClmVCnjBaQTwtok";

  Future<Position?> getCurrentLocation(BuildContext context) async {
    Position? currentPosition;
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
          timeLimit: Duration(seconds: gpsTimelimit));
      currentPosition = position;
    } on PermissionDeniedException catch (err) {
      currentPosition = null;
      _showEnableLocation(context);
    } on LocationServiceDisabledException catch (err) {
      currentPosition = null;
      _showEnableLocation(context);
    } on TimeoutException catch (err) {
      currentPosition = null;
      ToastUtil.showMessage("Location timeout");
      rethrow;
    } catch (err) {
      currentPosition = null;
      ToastUtil.showMessage("Error in Getting current location");
      rethrow;
    }

    return currentPosition;
  }

  void _showEnableLocation(BuildContext context) {
    // Show Bottomsheet
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext bc) {
        return const EnableLocationScreen();
      },
    );
  }

  Future<DirectionDetail?> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    String directionURL =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude} &key=$MAP_KEY";

    var res = await _getRequest(directionURL);
    if (res == null) return null;

    // DirectionDetail directionDetails = DirectionDetail(
        // encodedPoints: res["routes"][-1]["overview_polyline"]["points"],
        // distanceText: res["routes"][0]["legs"][0]["distance"]["text"],
        // distanceValue: res["routes"][0]["legs"][0]["distance"]["value"],
        // durationText: res["routes"][0]["legs"][0]["duration"]["text"],
        // durationValue: res["routes"][0]["legs"][0]["duration"]["value"]);

    // return directionDetails;
  }

  CameraPosition getCameraPosition(
    Position? position, {
    double tilt = DEFAULT_CAMERA_TILT,
    double bearning = DEFAULT_CAMERA_BEARNING,
    double zoom = DEFAULT_CAMERA_ZOOM,
  }) {
    if (position == null) {
      //show default camera position
      return CameraPosition(
        target: const LatLng(9.005401, 38.763611),
        zoom: zoom,
        tilt: tilt,
        bearing: bearning,
      );
    } else {
      LatLng latLngPosition = LatLng(position.latitude, position.longitude);
      return CameraPosition(
        target: latLngPosition,
        zoom: zoom,
        tilt: tilt,
        bearing: bearning,
      );
    }
  }

  CameraPosition getCameraPositionByLatLng(
    double lat,
    double lng, {
    double tilt = DEFAULT_CAMERA_TILT,
    double bearning = DEFAULT_CAMERA_BEARNING,
    double zoom = DEFAULT_CAMERA_ZOOM,
  }) {
    var latLngPosition = LatLng(lat, lng);
    return CameraPosition(
      target: latLngPosition,
      zoom: zoom,
      tilt: tilt,
      bearing: bearning,
    );
  }

  Future<dynamic> _getRequest(String url) async {
    var urlSite = Uri.parse(url);
    http.Response response = await http.get(urlSite);

    try {
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
        return decodeData;
      } else {
        // LoggerUtil.error("Invalid Status: ${response.statusCode.toString()}",
        //     tag: _tag);
        print("Invalid Status: ${response.statusCode.toString()}");
        return null;
      }
    } catch (error) {
      // LoggerUtil.error('Error in getting request.', error: error, tag: _tag);
      print("Error in sending request");
      print(error.toString());
      return null;
    }
  }
}

class DirectionDetail {
  final int? distanceValue;
  final int? durationValue;
  final String? distanceText;
  final String? durationText;
  final String? encodedPoints;

  DirectionDetail(
      {this.distanceValue,
      this.durationValue,
      this.distanceText,
      this.durationText,
      this.encodedPoints});
}
