import 'package:five_star/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CostomGoogleMap extends StatefulWidget {
  @override
  State<CostomGoogleMap> createState() => _CostomGoogleMapState();
}

class _CostomGoogleMapState extends State<CostomGoogleMap> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Google Map",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialcameraposition,
              ),
              mapType: MapType.normal,
              onMapCreated: (sa) {},
            ),
          ],
        ),
      ),
    );
  }
}
