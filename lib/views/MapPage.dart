import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, required this.lat, required this.lng}) : super(key: key);
  double lat, lng;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late double lata, lngb;
  @override
  void initState() {
    super.initState();
    lata = widget.lat;
    lngb = widget.lng;
    //
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 15),
      markers: {
        Marker(
            markerId: MarkerId("ที่อยู่จัดส่ง"), position: LatLng(lata, lngb)),
      },
      onTap: tounch,
    );
  }

  tounch(LatLng tappedPoint) {
    setState(() {
      lata = tappedPoint.latitude;
      lngb = tappedPoint.longitude;
    });
  }
}
