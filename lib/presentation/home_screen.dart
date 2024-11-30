import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(25.282623959000336, 89.01496503289209,)
    )
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(25.282623959000336, 89.01496503289209,),
            zoom: 16,

        ),
          onTap: (LatLng? latLang){
            print(latLang);
          },
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          trafficEnabled: true,
          markers: Set<Marker>.of(_marker),
          compassEnabled: true,
        ),
      ),
    );
  }
}
