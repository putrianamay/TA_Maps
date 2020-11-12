import 'dart:async';

import 'package:TA_Maps/latlang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MapPage extends StatelessWidget {
  static const routeName = '/mappingpage';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go-Tahu',
      home: Mapshow(),
    );
  }
}

class Mapshow extends StatefulWidget {
  @override
  _MapshowState createState() => _MapshowState();
}

class _MapshowState extends State<Mapshow> {
  static const LatLng _center = const LatLng(-6.266853, 106.702360); //pabrik 1
  final Set<Polyline> _polyline = {};

  BitmapDescriptor pinLocationIcon; //destinationIcon;
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  Future<void> _gotoTA1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(TA1));
  }

  static final CameraPosition TA1 = CameraPosition(
    target: LatLng(-6.266853, 106.702360), //Jl. Kali Ji'un - Pabrik 1
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );

  Future<void> _gotoTA2() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(TA2));
  }

  static final CameraPosition TA2 = CameraPosition(
    target: LatLng(-6.3467426, 106.7103855), //Jl. Puspiptek - Pabrik 2
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );

  Future<void> _gotoTA3() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(TA3));
  }

  static final CameraPosition TA3 = CameraPosition(
    target: LatLng(-6.3083565, 106.6943251), //Jl. Mawar - Pabrik 3
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );

  Future<void> _gotoTA4() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(TA4));
  }

  static final CameraPosition TA4 = CameraPosition(
    target: LatLng(-6.3264147, 106.7629380), //Jl. Talas - Pabrik 4
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );

  Future<void> _gotoTA5() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(TA5));
  }

  static final CameraPosition TA5 = CameraPosition(
    target: LatLng(-6.3028995, 106.7180412), //Jl. Merpati - Pabrik 5
    zoom: 18.151926040649414,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
    /*destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');*/
  }

  @override
  Widget build(BuildContext context) {
    Map markers = {};
    LatLng _lastMapPosition = _center;
    LatLng pinPosition = LatLng(-6.266853, 106.702360);

    Marker pabrik1 = Marker(
        markerId: MarkerId('Pabrik Tahu Amin (DY)'),
        position: LatLng(-6.2577140, 106.6985103),
        infoWindow: InfoWindow(title: 'Pabrik Tahun Amin (DY)'),
        icon: pinLocationIcon //destinationIcon,
        );
    Marker jalankalijiun = Marker(
      markerId: MarkerId('Jl. Kali Jiun'),
      position: LatLng(-6.266853, 106.702360),
      infoWindow: InfoWindow(title: 'Jl. Kali Jiun'),
      icon: pinLocationIcon,
    );

    Marker pabrik2 = Marker(
        markerId: MarkerId('Pabrik Tahu Na Po Tet'),
        position: LatLng(-6.3581547, 106.7152890),
        infoWindow: InfoWindow(title: 'Pabrik Tahu Na Po Tet'),
        icon: pinLocationIcon // destinationIcon,
        );
    Marker jalanpuspiptek = Marker(
      markerId: MarkerId('Jl. Puspiptek'),
      position: LatLng(-6.3467426, 106.7103855),
      infoWindow: InfoWindow(title: 'Jl. Puspiptek'),
      icon: pinLocationIcon,
    );

    Marker pabrik3 = Marker(
        markerId: MarkerId('Pabrik Tahu Kita'),
        position: LatLng(-6.3129901, 106.6930228),
        infoWindow: InfoWindow(title: 'Pabrik Tahu Kita'),
        icon: pinLocationIcon //destinationIcon,
        );
    Marker jalanmawar = Marker(
      markerId: MarkerId('Jl. Mawar'),
      position: LatLng(-6.3083565, 106.6943251),
      infoWindow: InfoWindow(title: 'Jl. Mawar'),
      icon: pinLocationIcon,
    );

    Marker pabrik4 = Marker(
        markerId: MarkerId('Pabrik Tahu Pak Tabah'),
        position: LatLng(-6.3332968, 106.7584304),
        infoWindow: InfoWindow(title: 'Pabrik Tahu Pak Tabah'),
        icon: pinLocationIcon // destinationIcon,
        );
    Marker jalantalas = Marker(
      markerId: MarkerId('Jl. Talas'),
      position: LatLng(-6.3264147, 106.7629380),
      infoWindow: InfoWindow(title: 'Jl. Talas'),
      icon: pinLocationIcon,
    );

    Marker pabrik5 = Marker(
        markerId: MarkerId('Pabrik Tahu Ahum/Gembor'),
        position: LatLng(-6.3011249, 106.7081599),
        infoWindow: InfoWindow(title: 'Pabrik Tahu Ahum/Gembor'),
        icon: pinLocationIcon //destinationIcon,
        );
    Marker jalanmerpati = Marker(
      markerId: MarkerId('Jl. Merpati'),
      position: LatLng(-6.3028995, 106.7180412),
      infoWindow: InfoWindow(title: 'Jl. Merpati'),
      icon: pinLocationIcon,
    );

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        curve: Curves.fastOutSlowIn,
        animatedIconTheme: IconThemeData.fallback(),
        children: [
          SpeedDialChild(
              label: 'Pabrik Tahu Amin (DY)',
              child: FloatingActionButton(
                shape: CircleBorder(),
                child: Image.asset(''),
                onPressed: () {
                  _gotoTA1();
                  setState(() {
                    _polyline.add(Polyline(
                      polylineId: PolylineId(_lastMapPosition.toString()),
                      visible: true,
                      points: latlngpabrik1,
                      color: Colors.blue,
                      width: 5,
                    ));
                  });
                },
              )),
          SpeedDialChild(
              label: 'Pabrik Tahu Na Po Tet',
              child: FloatingActionButton(
                shape: CircleBorder(),
                child: Image.asset(''),
                onPressed: () {
                  _gotoTA2();
                  setState(() {
                    _polyline.add(Polyline(
                      polylineId: PolylineId(_lastMapPosition.toString()),
                      visible: true,
                      points: latlngpabrik2,
                      color: Colors.blue,
                      width: 5,
                    ));
                  });
                },
              )),
          SpeedDialChild(
              label: 'Pabrik Tahu Kita',
              child: FloatingActionButton(
                shape: CircleBorder(),
                child: Image.asset(''),
                onPressed: () {
                  _gotoTA3();
                  setState(() {
                    _polyline.add(Polyline(
                      polylineId: PolylineId(_lastMapPosition.toString()),
                      visible: true,
                      points: latlngpabrik3,
                      color: Colors.blue,
                      width: 5,
                    ));
                  });
                },
              )),
          SpeedDialChild(
              label: 'Pabrik Tahu Pak Tabah',
              child: FloatingActionButton(
                shape: CircleBorder(),
                child: Image.asset(''),
                onPressed: () {
                  _gotoTA4();
                  setState(() {
                    _polyline.add(Polyline(
                      polylineId: PolylineId(_lastMapPosition.toString()),
                      visible: true,
                      points: latlngpabrik4,
                      color: Colors.blue,
                      width: 5,
                    ));
                  });
                },
              )),
          SpeedDialChild(
              label: 'Pabrik Tahu Ahum/Gembor',
              child: FloatingActionButton(
                shape: CircleBorder(),
                child: Image.asset(''),
                onPressed: () {
                  _gotoTA5();
                  setState(() {
                    _polyline.add(Polyline(
                      polylineId: PolylineId(_lastMapPosition.toString()),
                      visible: true,
                      points: latlngpabrik5,
                      color: Colors.blue,
                      width: 5,
                    ));
                  });
                },
              )),
        ],
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          tiltGesturesEnabled: false,
          compassEnabled: true,
          markers: {
            pabrik1,
            jalankalijiun,
            pabrik2,
            jalanpuspiptek,
            pabrik3,
            jalanmawar,
            pabrik4,
            jalantalas,
            pabrik5,
            jalanmerpati
          },
          polylines: _polyline,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            zoom: 13,
            bearing: 30,
            target: pinPosition,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            setState(() {
              _markers.add(Marker(
                markerId: MarkerId(_lastMapPosition.toString()),
                visible: true,
                position: _lastMapPosition,
                icon: pinLocationIcon,
                infoWindow: InfoWindow(title: 'Location'),
              ));

              /*_markers.add(Marker(
                  markerId: MarkerId(_lastMapPosition.toString()),
                  visible: true,
                  position: _lastMapPosition,
                  icon: pinLocationIcon //destinationIcon,
                  ));*/
            });
          },
        ),
      ]),
    );
  }
}
