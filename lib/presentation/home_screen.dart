import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(25.282623959000336, 89.01496503289209,),
            zoom: 16,
        ),
          onMapCreated: (GoogleMapController controller){
            googleMapController = controller;
          },
          onTap: (LatLng? latLang){
            print(latLang);
          },
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          trafficEnabled: true,
          markers: <Marker>{
            const Marker(
              markerId: MarkerId("Home"),
              position: LatLng(25.282623959000336, 89.01496503289209,),
            ),
            Marker(
              markerId: const MarkerId("1"),
              position: const LatLng(25.277931537260585, 89.0102792903781),
              infoWindow: InfoWindow(
                title: "Home",
                onTap: (){print("Home");},
                snippet: "Home snippet"
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              draggable: true,
              onDragStart: (LatLng onStartLatLang){
                print("on start drag $onStartLatLang");
              },
              onDragEnd: (LatLng onEndLatLang){
                print("On end drag $onEndLatLang");
              }
            ),
        },
          circles: <Circle>{
            Circle(
              circleId: const CircleId("Dengue"),
              center: const LatLng(25.39431080933531, 88.98571562021971),
              radius:  3000,
              fillColor: Colors.red.withOpacity(0.4),
              strokeWidth: 0
            ),
            Circle(
              circleId: const CircleId("Safe zone"),
              radius: 5000,
              fillColor: Colors.green.withOpacity(0.4),
              strokeWidth: 0,
              center: LatLng(25.50087053611478, 88.95616371184587),

            ),
          },
          polygons: <Polygon>{
            const Polygon(
              polygonId: PolygonId("polygon"),
              fillColor: Colors.blue,
              strokeWidth: 0,
              points: <LatLng>[
                LatLng(25.633150212189225, 88.99842090904713),
                LatLng(25.7260025893651, 88.99343568831682),
                LatLng(25.801044566982704, 89.0997876226902),
                LatLng(25.744821134341166, 89.14417985826731),
                LatLng(25.650913527905924, 89.12162750959396),
                LatLng(25.617311251273424, 89.11498066037893),
                LatLng(25.63807302728226, 89.03165582567453),
              ]
            )
          },
          polylines: <Polyline>{
            const Polyline(
              polylineId: PolylineId("start"),
              jointType: JointType.round,
              color: Colors.black,
              points: <LatLng>[
                LatLng(25.510253596740476, 89.05274368822575),
                LatLng(25.478732953540614, 89.02185972779989),
                LatLng(25.457228527886254, 89.0036927908659),
                LatLng(25.445746000934083, 88.97301066666842),
              ]
            ),
          },
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
            print("i'm here");
          },
        child: const Icon(Icons.location_searching_rounded),
      ),
    );
  }
}
