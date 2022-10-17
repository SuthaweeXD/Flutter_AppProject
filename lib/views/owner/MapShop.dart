import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapShop extends StatefulWidget {
  MapShop({Key? key}) : super(key: key);

  @override
  State<MapShop> createState() => _MapShopState();
}

class _MapShopState extends State<MapShop> {
  static const double hueGreen = 120.0;
  static final CameraPosition tr = CameraPosition(
      target: LatLng(6.0266777111162755, 101.95937632021678), zoom: 15);

  List<Marker> mymarker = [
    Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(hueGreen),
        markerId: MarkerId("ที่อยู่ร้าน"),
        position: LatLng(6.0266777111162755, 101.95937632021678))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GoogleMap(
            initialCameraPosition: tr,
            markers: Set.from(mymarker),
            // onTap: tounch,
          ),
        ),
      ),
    );
  }

  // tounch(LatLng tappedPoint) {
  //   setState(() {
  //     mymarker = [];
  //     mymarker.add(Marker(
  //         markerId: MarkerId(tappedPoint.toString()), position: tappedPoint));
  //   });
  // }
}
