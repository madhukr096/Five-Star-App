/*import 'package:five_star/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CostomGoogleMap extends StatefulWidget {
  @override
  State<CostomGoogleMap> createState() => _CostomGoogleMapState();
}

class _CostomGoogleMapState extends State<CostomGoogleMap> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoofleMapController =controller;
  Location _location=Location();
void _onMapCreated(GoogleMapControlle _value){
controller=_value;
_location.onLocationChanged.listen((event){});
controlled.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(),);)
target:Lating(event.latitude,event.longitude),
zoom:15,
});
}
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
              onMapCreated: onMapCreated,
                myLocationEnabled:true,
            ),
            Position(
              bottom:0,
              left:0,
              right:0,
              child:Container(
                height:50,
                width:double.infinity,
                width:double.infinity,
                margin:EdgeInsets.only(bottom:40,
              left:10,
              right:60,
              top:40),
              child:MaterialButton(
                onPressed:(){},
                color:primaryColor,
                child:Text("Set Location"),
                shape:StadiumBorder(),
                
              )
              ),

            )
          ],
        ),
      ),
    );
  }
}*/
