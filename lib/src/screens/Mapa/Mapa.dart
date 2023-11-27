import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  late MapController mapController;
  TextEditingController _searchController1 = TextEditingController();
  TextEditingController _searchController2 = TextEditingController();
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  void _centerMap() {
    mapController.move(LatLng(-8.0476, -34.8770), 13.0);
  }

  void _showMapWithLine(LatLng destinationLatLng) {
    // Calcula a rota entre a localização atual e o destino pesquisado
    LatLng startLatLng = polylineCoordinates.isNotEmpty
        ? polylineCoordinates.first
        : LatLng(-8.0476, -34.8770);

    // Adiciona a linha entre a localização atual e o destino pesquisado
    polylineCoordinates = [
      startLatLng,
      destinationLatLng,
    ];

    setState(() {}); // Redesenha o mapa com a nova linha
  }

  void _searchAndShowOnMap(String query, TextEditingController controller) async {
    List<Location> locations = await locationFromAddress(query);

    if (locations.isNotEmpty) {
      LatLng destinationLatLng =
      LatLng(locations.first.latitude, locations.first.longitude);

      // Atualiza a linha e o marcador no mapa
      _showMapWithLine(destinationLatLng);

      // Atualiza o marcador de saída no mapa
      if (controller == _searchController1) {
        _updateStartMarker(destinationLatLng, Colors.red);
      }

      // Atualiza o marcador no final da linha
      if (controller == _searchController2) {
        _updateDestinationMarker(destinationLatLng, Colors.blue);
      }

      // Atualiza a localização inicial para a nova posição
      setState(() {
        polylineCoordinates.clear();
        polylineCoordinates.add(destinationLatLng);
      });
    } else {
      print('Nenhum resultado encontrado');
    }
  }

  void _updateStartMarker(LatLng startLatLng, Color color) {
    setState(() {
      _destinationMarkers.removeWhere((marker) => marker.point == polylineCoordinates.first);
      _destinationMarkers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: startLatLng,
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: color,
              size: 50.0,
            ),
          ),
        ),
      );
    });
  }

  void _updateDestinationMarker(LatLng destinationLatLng, Color color) {
    // Atualiza o marcador no final da linha
    setState(() {
      polylineCoordinates.isNotEmpty
          ? polylineCoordinates.last
          : LatLng(-8.0420, -34.8730);
      _destinationMarkers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: polylineCoordinates.isNotEmpty
              ? polylineCoordinates.last
              : LatLng(-8.0420, -34.8730),
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: color,
              size: 50.0,
            ),
          ),
        ),
      );
    });
  }

  void _zoomIn() {
    mapController.move(mapController.center, mapController.zoom + 1.0);
  }

  void _zoomOut() {
    mapController.move(mapController.center, mapController.zoom - 1.0);
  }

  List<Marker> _destinationMarkers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController1,
            decoration: InputDecoration(
              hintText: 'Endereço de Saída',
              contentPadding: EdgeInsets.all(16),
              suffixIcon: IconButton(
                onPressed: () {
                  String query = _searchController1.text;
                  _searchAndShowOnMap(query, _searchController1);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
          TextField(
            controller: _searchController2,
            decoration: InputDecoration(
              hintText: 'Endereço de Destino',
              contentPadding: EdgeInsets.all(16),
              suffixIcon: IconButton(
                onPressed: () {
                  String query = _searchController2.text;
                  _searchAndShowOnMap(query, _searchController2);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: polylineCoordinates.isNotEmpty
                    ? polylineCoordinates.first
                    : LatLng(-8.0476, -34.8770),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                  markers: [
                    ..._destinationMarkers,
                  ],
                ),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                      points: polylineCoordinates,
                      color: Colors.blue,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _centerMap,
            backgroundColor: Color(0xFF3A0751),
            child: Icon(
              Icons.gps_fixed,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _zoomIn,
            backgroundColor: Color(0xFF3A0751),
            child: Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _zoomOut,
            backgroundColor: Color(0xFF3A0751),
            child: Icon(
              Icons.zoom_out,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
