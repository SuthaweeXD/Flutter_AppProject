import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMap extends StatefulWidget {
  AddressMap({Key? key, required this.lat, required this.lng})
      : super(key: key);
  double lat, lng;
  @override
  State<AddressMap> createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
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
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 15),
        markers: {
          Marker(
              markerId: MarkerId("ที่อยู่จัดส่ง"),
              position: LatLng(lata, lngb)),
        },
        // onTap: tounch,
      ),
    );
  }

  tounch(LatLng tappedPoint) {
    setState(() {
      lata = tappedPoint.latitude;
      lngb = tappedPoint.longitude;
    });
  }
}

class MapWidget extends StatefulWidget {
  MapWidget({Key? key, required this.lat, required this.lng}) : super(key: key);
  double lat, lng;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
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
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 15),
        markers: {
          Marker(
              markerId: MarkerId("ที่อยู่จัดส่ง"),
              position: LatLng(lata, lngb)),
        },
        // onTap: tounch,
      ),
    );
  }

  tounch(LatLng tappedPoint) {
    setState(() {
      lata = tappedPoint.latitude;
      lngb = tappedPoint.longitude;
    });
  }
}
