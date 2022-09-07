import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMap extends StatefulWidget {
  AddressMap({Key? key}) : super(key: key);

  @override
  State<AddressMap> createState() => _AddressMapState();
}

class _AddressMapState extends State<AddressMap> {
  static final CameraPosition tr = CameraPosition(
      target: LatLng(13.749085509399437, 100.53328902001459), zoom: 15);
  List<Marker> mymarker = [
    Marker(
        markerId: MarkerId("นายแดง"),
        position: LatLng(13.749085509399437, 100.53328902001459))
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: tr,
      markers: Set.from(mymarker),
      onTap: tounch,
    );
  }

  tounch(LatLng tappedPoint) {
    setState(() {
      mymarker = [];
      mymarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()), position: tappedPoint));
    });
  }
}
