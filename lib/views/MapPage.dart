import 'package:flutter/material.dart';
import 'package:flutter_application_project/config/api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, required this.lat, required this.lng, required this.data})
      : super(key: key);
  double lat, lng;
  final dynamic data;
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
        onTap: tounch,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(widget.data);
          print(lata);
          print(lngb);

          sendlocation(lata, lngb, widget.data, context);
        },
        label: const Text(
          'บันทึกที่อยู่',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 253, 253),
          ),
        ),
        icon: const Icon(Icons.save),
        backgroundColor: Color.fromARGB(255, 58, 205, 0),
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
