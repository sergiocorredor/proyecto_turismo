import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaUbicacion extends StatefulWidget {
  @override
  _MapaUbicacionState createState() => _MapaUbicacionState();
}

class _MapaUbicacionState extends State<MapaUbicacion> {
  Set<Marker> _markers = Set();
  LatLng _posicion = LatLng(7.072675, -73.105252);

  GoogleMapController _mapaControlador;

  @override
  void initState() {
    super.initState();
  }

  void mapaCreado(GoogleMapController controlador) {
    _mapaControlador = controlador;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('SENA'),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(7.072675, -73.105252)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
      onMapCreated: mapaCreado,
      // myLocationEnabled: true,
      markers: _markers,
      initialCameraPosition: CameraPosition(target: _posicion, zoom: 16.0),
    );
  }
}
