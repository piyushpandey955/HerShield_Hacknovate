import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGooglePlex = LatLng(28.669155, 77.453758);

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState(){
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "images/protector.png").then((icon){
      setState(() { 
        markerIcon = icon;
    });
    }, );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(28.699, 77.453),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("2"),
            position: LatLng(28.688, 77.463),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("3"),
            position: LatLng(28.677, 77.453),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("4"),
            position: LatLng(28.666, 77.453),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("5"),
            position: LatLng(28.655, 77.445),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("6"),
            position: LatLng(28.645, 77.459),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("7"),
            position: LatLng(28.635, 77.453),
            // draggable: true,
            icon: markerIcon,
          ),
          Marker(
            markerId: MarkerId("8"),
            position: LatLng(28.637, 77.453),
            // draggable: true,
            icon: markerIcon,
          ),
        },
      ),
    );
  }
}
