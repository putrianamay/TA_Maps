import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:TA_Maps/latlang.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_controller/google_maps_controller.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(-6.330727, 106.755581);
const LatLng DEST_LOCATION = LatLng(-6.328226, 106.721834);

class MapPage extends StatelessWidget {
  static const routeName = '/maps';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Map(), //nama class
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Map> {
  static const LatLng _center = const LatLng(-6.2577140, 106.6985103); //pabrik 1
  final Set<Polyline> _polyline = {};

  BitmapDescriptor sourceIcon, destinationIcon;
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  Future<void> _gotoAsal1() async {
    final GoogleMapController controller = await _controller.future ;
    controller.animateCamera(CameraUpdate.newCameraPosition(Asal1));
  }

  static final CameraPosition Asal1 = CameraPosition(
    target: LatLng(-6.266853, 106.702360), //Jl. Kali Ji'un - Pabrik 1
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
    );
    )
  
}

  static const LatLng _center = const LatLng(-6.330727, 106.755581);
  // this set will hold my markers
  Set<Marker> _markers = {};

  // this will hold the generated polylines
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey = "<AIzaSyDQy2XAFOfHZCAjnA3U4GsD8N8J39WKzZA>";

  // for my custom icons
  

  int currentIndex;

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
    setMapPins();
    setPolyLine();
  }

  void setSourceAndDestinationIcons() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png')
        .then((onValue) => sourceIcon = onValue);

    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/destination_map_marker.png')
        .then((onValue) => destinationIcon = onValue);
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION);
    LatLng lastmapposition = _center;

    return GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        markers: _markers,
        polylines: _polylines,
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        //onMapCreated: onMapCreated);

        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(Utils.mapStyles);
          _controller.complete(controller);
          setMapPins();
          setPolyLine();

          _polylines.add(Polyline(
            polylineId: PolylineId(_polylines.toString()),
            visible: true,
            points: latlngpabrik1,
            color: Colors.blue,
            width: 5,
          ));

          _markers.add(Marker(
            markerId: MarkerId(lastmapposition.toString()),
            visible: true,
            position: lastmapposition,
            icon: sourceIcon,
          ));

          _markers.add(Marker(
            markerId: MarkerId(lastmapposition.toString()),
            visible: true,
            position: lastmapposition,
            icon: destinationIcon,
          ));
        });
  }

  void setPolyLine() {
    setState(() {});
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: LatLng(-6.266848, 106.702363),
        infoWindow: InfoWindow(title: 'Jl. Kaliurung'),
        icon: sourceIcon,
      ));
      // destination pin
      _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: LatLng(-6.2577140, 106.6985103),
        infoWindow: InfoWindow(title: 'Pabrik Tahu Amin'),
        icon: destinationIcon,
      ));
    });
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
