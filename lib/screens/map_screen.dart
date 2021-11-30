import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//Started this portion need to finish social feed first

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final dumbyData = LatLng(43.9644879, -78.896896);
  //var center = LatLng(currentLocation , _longitude)
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(zoom: 16.0, center: dumbyData),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/aforbes918/ckwmdijqt153q14nl8d25co18/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWZvcmJlczkxOCIsImEiOiJja3djemlxYjcwNWd1MnhwaTJ3a252YjR1In0.Bg4yEPvnwU1VJsdZmS2dFA",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiYWZvcmJlczkxOCIsImEiOiJja3djemlxYjcwNWd1MnhwaTJ3a252YjR1In0.Bg4yEPvnwU1VJsdZmS2dFA',
              'id': 'mapbox.mapbox-streets-v8'
            }),
        MarkerLayerOptions(markers: [
          Marker(
              point: dumbyData,
              builder: (context) {
                return Container(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Colors.blueAccent,
                    size: 50,
                  ),
                );
              })
        ])
      ],
    );
  }
}
