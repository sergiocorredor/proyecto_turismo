import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaUbicacion extends StatefulWidget {
  final String _nombre;
  final double _latitud;
  final double _longitud;

  MapaUbicacion(this._nombre, this._latitud, this._longitud);

  @override
  _MapaUbicacionState createState() => _MapaUbicacionState();
}

class _MapaUbicacionState extends State<MapaUbicacion> {
  Set<Marker> _markers = Set();
  LatLng _posicion;
  GoogleMapController _mapaControlador;
  Location ubicacion = new Location();
  LocationData ubicacionActual;

  @override
  void initState() {
    super.initState();
    _posicion = LatLng(widget._latitud, widget._longitud);
  }

  void mapaCreado(GoogleMapController controlador) {
    setState(() {
      obtenerUbicacion();
      _mapaControlador = controlador;
      _markers.add(Marker(
          markerId: MarkerId(widget._nombre),
          infoWindow: InfoWindow(title: widget._nombre),
          position: _posicion));
    });
  }

  //Muestra ubicación. Pero al mostrar, desaparece el mapa.
  void obtenerUbicacion() async {
    try {
      ubicacionActual = await ubicacion.getLocation();
      print("locationLatitude: ${ubicacionActual.latitude.toString()}");
      print("locationLongitude: ${ubicacionActual.longitude.toString()}");
      setState(() {});
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        String error = 'Permiso denegado';
        print(error);
      }
      ubicacionActual = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.satellite,
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
      onMapCreated: mapaCreado,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: _markers,
      initialCameraPosition: CameraPosition(target: _posicion, zoom: 14.0),
    );
  }
}
