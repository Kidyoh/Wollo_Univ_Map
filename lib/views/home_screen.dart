import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiot_map/models/KiotPlace.model.dart';
import 'package:kiot_map/services/database.service.dart';
import 'package:kiot_map/shared/custom_circuar_icon_button.dart';
import 'package:kiot_map/utils/map_utils.dart';
import 'package:kiot_map/utils/toast_utils.dart';
import 'package:kiot_map/views/about_screen.dart';

import '../services/kosMarkers.dart';
import '../services/map.service.dart';
import '../utils/image_utils.dart';
import 'expanded_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Services
  final MapService _mapService = MapService();
  final DatabaseService _dbService = DatabaseService();
  //controller
  late final Completer<GoogleMapController> _controller = Completer();

  // States
  final List<KiotPlace> _allKiotPlaces = [];
  final List<KiotPlace> _kiotPlaces = [];
  int _index = 0;
  KiotPlace? selectedPlace;

  // Map related
  MapType _mapType = MapType.satellite;
  late Uint8List currentMarkerIcon;
  final currentMarkerId = 'marker_current';
  final double _defaultZoom = 14;
  final LatLng _kiotLocation =
      const LatLng(11.05089672932272, 39.74741234068117);

  Set<Polyline> polylineSet = {};
  List<LatLng> pLineCoordinates = [];
  Set<Marker> markers = {};

  Position? _currentPosition;

  // Controllers
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  final TextEditingController _searchController = TextEditingController();
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _controllerGoogleMap = Completer();

    // Get User's Current Position
    getCurrentPosition();

    // Add Kiot places markers
    prepareKiotPlaceMarkers();
  }

  void getCurrentPosition() {
    ToastUtil.showMessage("Getting current location ....");
    _mapService.getCurrentLocation(context).then((value) async {
      _currentPosition = value;
      if (_currentPosition != null) {
        await setCurrentUserMarker(
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude));
        moveCamera(_currentPosition!);
      }
    });
  }

  void changeMapType(MapType mapType) {
    setState(() {
      _mapType = mapType;
    });
  }

  void moveCamera(Position position) async {
    final GoogleMapController controller = await _controllerGoogleMap.future;
    var cameraPosition = _mapService.getCameraPosition(position);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void moveCameraByLatLang(LatLng coordinate,
      {double zoom = DEFAULT_CAMERA_ZOOM,
      double bearing = DEFAULT_CAMERA_BEARNING}) async {
    final GoogleMapController controller = await _controllerGoogleMap.future;
    var cameraPosition = _mapService.getCameraPositionByLatLng(
        coordinate.latitude, coordinate.longitude,
        zoom: zoom);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void prepareKiotPlaceMarkers() {
    var placesResult = _dbService.getAllKiotPlaces();
    _allKiotPlaces.addAll(placesResult);
    _kiotPlaces.addAll(placesResult);

    for (var place in _allKiotPlaces) {
      var marker = Marker(
        markerId: MarkerId('marker_${place.id}'),
        position: place.location,
        infoWindow: InfoWindow(
          title: place.name,
        ),
      );
      markers.add(marker);
    }
  }

  Future handlePlaceCardTap(KiotPlace place) async {
    // Show route line
  await showRouteLine(endPoint: place.location);

  // Scroll to selected card
  int selectedIndex = _kiotPlaces.indexWhere((kiotPlace) => kiotPlace.id == place.id);
  _carouselController.animateToPage(selectedIndex);

  // Set selected place
  setState(() {
    selectedPlace = place;
  });
  }

  Future setCurrentUserMarker(LatLng location) async {
    ImageUtils.getBytesFromAsset("images/current_marker.png", 70).then((value) {
      currentMarkerIcon = value;

      Marker marker = Marker(
        markerId: const MarkerId('marker_current'),
        position: location,
        icon: BitmapDescriptor.fromBytes(currentMarkerIcon),
      );

      setState(() {
        markers.add(marker);
      });
    });
  }

  Future showRouteLine({required LatLng endPoint}) async {
    // Get Direction

    setState(() {
      pLineCoordinates.clear();
      polylineSet.clear();
    });

    LatLng startPoint = _kiotLocation;

    if (_currentPosition != null) {
      startPoint =
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    }

    DirectionDetail? directionDetail =
        await _mapService.obtainPlaceDirectionDetails(startPoint, endPoint);
    if (directionDetail == null) {
      print(">>> Direction Detail is empty <<<");
      return;
    }

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResult =
        polylinePoints.decodePolyline(directionDetail.encodedPoints!);

    if (decodedPolyLinePointsResult.isNotEmpty) {
      for (var pointLatLng in decodedPolyLinePointsResult) {
        pLineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    }
    Polyline polyline = Polyline(
        color: Colors.orangeAccent,
        polylineId: const PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoordinates,
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        geodesic: true);

    setState(() {
      polylineSet.add(polyline);
    });

    var controller = await _controllerGoogleMap.future;
    final latLngBounds = MapUtils.getLatLngBounds(startPoint, endPoint);
    controller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 40));

    moveCameraByLatLang(endPoint, zoom: 18);
  }

  void _filterPlace(String searchKey) {
    List<KiotPlace> results = [];
    if (searchKey.isEmpty) {
      results = _allKiotPlaces;
    } else {
      results = _allKiotPlaces
          .where((place) => place.name
              .trim()
              .toLowerCase()
              .contains(searchKey.trim().toLowerCase()))
          .toList();
    }
    setState(() {
      _kiotPlaces.clear();

      if (results.isNotEmpty) {
        _kiotPlaces.addAll(results);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            // Map
            _mapSection(),

            // Right Button
            _mapButtonSections(),

            // Search Text field
            _searchTextSection(),

            // Cards
            _buildPlaceCards(),
          ],
        ),
      ),
    );
  }

  Widget _mapSection() {
    return GoogleMap(
        initialCameraPosition:
            CameraPosition(target: _kiotLocation, zoom: _defaultZoom),
        markers: markers,
        polylines: polylineSet,
        zoomControlsEnabled: false,
        mapType: _mapType,
        onMapCreated: (GoogleMapController controller) async {
          _controllerGoogleMap.complete(controller);

          // show routes
          const libraryLoc = LatLng(11.049228373433188, 39.748424284919764);
          await showRouteLine(endPoint: libraryLoc);
        });
  }

  Widget _buildPlaceCards() {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.only(bottom: 20),
    child: CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 150.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.60,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: false,
        pageSnapping: true,
        onPageChanged: (index, reason) {
          setState(() {
            _index = index;
          });
          final place = _kiotPlaces[index];
          final location = place.location;
          _controller.future.then((controller) {
            controller.animateCamera(CameraUpdate.newLatLng(location));
          });
        },
      ),
      items: _kiotPlaces.map((place) {
        final LatLng info = place.location;
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              print(info);
              _controllerGoogleMap.future.then((controller) {
                controller.animateCamera(CameraUpdate.newLatLng(info));
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'place Name',
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      }).toList(),
    ),
  );
}

  Widget _mapButtonSections() {
    return Positioned(
        top: 160,
        right: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomCircularIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => const AboutScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.info),
            ),
            CustomCircularIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => const Extended_image(),
                  ),
                );
              },
              icon: const Icon(Icons.explore_rounded),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCircularIconButton(
              onPressed: () {
                changeMapType(MapType.normal);
              },
              icon: const Icon(Icons.map_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCircularIconButton(
              onPressed: () {
                changeMapType(MapType.satellite);
              },
              icon: const Icon(Icons.satellite_alt),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCircularIconButton(
              onPressed: () {
                getCurrentPosition();
              },
              icon: const Icon(Icons.my_location),
            ),
          ],
        ));
  }

  Widget _searchTextSection() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: 'Where do you wanna go',
            suffixIcon: _searchController.text.isEmpty
                ? const Icon(Icons.search)
                : CustomCircularIconButton(
                    elevation: 0,
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _kiotPlaces.clear();
                        _kiotPlaces.addAll(_allKiotPlaces);
                      });
                    },
                    icon: const Icon(Icons.close)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          controller: _searchController,
          onChanged: (value) {
            _filterPlace(value);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
