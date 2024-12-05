import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_practice/presentation/home_screen.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() => _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {

  Position? userLocation;

  @override
  void initState() {
    super.initState();
    listenCurrentLocation();
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
        ).listen((pos)=>print(pos));
        // print(pos);
        // userLocation = position;
        // setState(() {});
      }else{
        Geolocator.openLocationSettings();
      }
    }else{
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      }Geolocator.openAppSettings();

    }
  }

  Future<void>getCurrentLocation()async {
    final isGranted = await isLocationPermissionGranted();
    if(isGranted){
      final isServiceEnabled = await checkGPSServiceEnable();
      if(isServiceEnabled){
        Position position = await Geolocator.getCurrentPosition();
        print(position);
        print(position.latitude);
        print(position.longitude);
        userLocation = position;
        setState(() {});
      }else{
        Geolocator.openLocationSettings();
      }
    }else{
      final result = await requestLocationPermission();
      if(result){
        getCurrentLocation();
      }Geolocator.openAppSettings();

    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Permission"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My current location $userLocation"),
            ElevatedButton(
                onPressed: (){
                  getCurrentLocation();
                },
                child: const Text("Ask for Location permission")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context)=>
                          HomeScreen(
                            // Lat: userLocation!.latitude,
                            // Lng: userLocation!.longitude,
                          )));
                },
                child: const Text("Check map")),
          ],
        ),
      ),
    );
  }
}
