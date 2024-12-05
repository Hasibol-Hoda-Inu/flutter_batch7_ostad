import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    // required this.Lat,
    // required this.Lng
  });

  // final double Lat;
  // final double Lng;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;
  Set<Marker> _marker = {};
  Set<Polyline> _polyLine = {};
  List<LatLng> _routPoints = [];
  Position? userLocation;

  @override
  void initState() {
    super.initState();
    listenCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real-Time Location Tracker", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(userLocation?.latitude ?? 25.0, userLocation?.longitude ?? 89.0,),
            zoom: 16,
        ),
          onMapCreated: (GoogleMapController controller){
            googleMapController = controller;
          },
          // onTap: (LatLng? latLang){
          //   if(latLang != null){
          //
          //   }
          //   setState(() {});
          //   print(latLang);
          // },
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          trafficEnabled: true,
          markers: _marker,
          // circles: <Circle>{
          //   Circle(
          //     circleId: const CircleId("Dengue"),
          //     center: const LatLng(25.39431080933531, 88.98571562021971),
          //     radius:  3000,
          //     fillColor: Colors.red.withOpacity(0.4),
          //     strokeWidth: 0
          //   ),
          //   Circle(
          //     circleId: const CircleId("Safe zone"),
          //     radius: 5000,
          //     fillColor: Colors.green.withOpacity(0.4),
          //     strokeWidth: 0,
          //     center: LatLng(25.50087053611478, 88.95616371184587),
          //
          //   ),
          // },
          // polygons: <Polygon>{
          //   const Polygon(
          //     polygonId: PolygonId("polygon"),
          //     fillColor: Colors.blue,
          //     strokeWidth: 0,
          //     points: <LatLng>[
          //       LatLng(25.633150212189225, 88.99842090904713),
          //       LatLng(25.7260025893651, 88.99343568831682),
          //       LatLng(25.801044566982704, 89.0997876226902),
          //       LatLng(25.744821134341166, 89.14417985826731),
          //       LatLng(25.650913527905924, 89.12162750959396),
          //       LatLng(25.617311251273424, 89.11498066037893),
          //       LatLng(25.63807302728226, 89.03165582567453),
          //     ]
          //   )
          // },
          polylines: _polyLine,
          compassEnabled: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            googleMapController.animateCamera(CameraUpdate
                .newCameraPosition(const CameraPosition(
                target: LatLng(25.282623959000336, 89.01496503289209,),
                zoom: 16,
            ),
            ),
            );
          },
        child: const Icon(Icons.location_searching_rounded),
      ),
    );
  }

  Future<void> listenCurrentLocation() async {
    final isGranted = await isLocationPermissionGranted();
    if(isGranted){
      final isServiceEnabled = await checkGPSServiceEnable();
      if(isServiceEnabled){
        Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                timeLimit: Duration(seconds: 10),
                accuracy: LocationAccuracy.best
            )
        ).listen((Position position) {
          print(position);
          userLocation = position;
          final LatLng newPosition = LatLng(position.latitude, position.longitude);
          _routPoints.add(newPosition);
          _marker.clear();
          _marker.addAll({
            Marker(
            markerId: const MarkerId("current location"),
            position: newPosition,
            infoWindow: InfoWindow(
                title: "My Current Location",
                snippet: "${position.latitude},${position.longitude}"
            ),
          ),
            Marker(
            markerId: const MarkerId("start point"),
            position: _routPoints.isNotEmpty ? _routPoints[0] : newPosition,
            infoWindow: InfoWindow(
                title: "My Current Location",
                snippet: "${position.latitude},${position.longitude}"
            ),
          ),
          });
          _polyLine.clear();
          _polyLine.add(Polyline(
              polylineId: const PolylineId("routes"),
              jointType: JointType.round,
              color: Colors.blue,
              points: _routPoints,
          ),);
          setState(() {});
          googleMapController.animateCamera(CameraUpdate.newLatLng(newPosition));
        });
      }else{
        Geolocator.openLocationSettings();
      }
    }else{
      final result = await requestLocationPermission();
      if(result){
        listenCurrentLocation();
      }Geolocator.openAppSettings();

    }
  }

  // Future<void>getCurrentLocation()async {
  //   final isGranted = await isLocationPermissionGranted();
  //   if(isGranted){
  //     final isServiceEnabled = await checkGPSServiceEnable();
  //     if(isServiceEnabled){
  //       Position position = await Geolocator.getCurrentPosition();
  //       print(position);
  //       print(position.latitude);
  //       print(position.longitude);
  //       userLocation = position;
  //       setState(() {});
  //     }else{
  //       Geolocator.openLocationSettings();
  //     }
  //   }else{
  //     final result = await requestLocationPermission();
  //     if(result){
  //       getCurrentLocation();
  //     }Geolocator.openAppSettings();
  //
  //   }
  // }

  Future<bool> requestLocationPermission()async {
    LocationPermission locationPermission = await Geolocator.requestPermission();
    if(locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> checkGPSServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<bool> isLocationPermissionGranted() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse){
      return true;
    }else{
      return false;
    }
  }
}
