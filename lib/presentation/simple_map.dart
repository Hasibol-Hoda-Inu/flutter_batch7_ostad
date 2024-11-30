import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../utility.dart';

class SimpleMap extends StatefulWidget{
  const SimpleMap({super.key});

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap>{
  CameraPosition initialPosition= const CameraPosition(target: LatLng(23.835677, 90.380325), zoom: 12);
  MapLibreMapController? mController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bari koi map"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.5),
      ),
      body: MapLibreMap(
        initialCameraPosition: initialPosition,   // set map initial location where map will show first
        onMapCreated: (MapLibreMapController mapController){  //called when map object is created
          mController= mapController;
        },
        styleString: Urls.mapUrl,
        tiltGesturesEnabled: true,
        compassViewPosition: CompassViewPosition.bottomRight,
        myLocationEnabled: true,
      ),
    );
  }
}