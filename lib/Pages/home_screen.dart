import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:salvatore_app/Utils/Styles/styles.dart';
import 'package:salvatore_app/Utils/Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final center = LatLng(37.810575, -122.477174);

  MapboxMapController? mapController;

  String selectedStyle =
      'mapbox://styles/hufflevotom/ckwp8d95g2hhy15ohwuo0a8os';

  final oscuroStyle = 'mapbox://styles/hufflevotom/ckwp8plz811tt14qjsrcyjfpy';
  final streetStyle = 'mapbox://styles/hufflevotom/ckwp8d95g2hhy15ohwuo0a8os';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "lib/Utils/Images/Ubicacion.png");
    // addImageFromUrl("networkImage", "https://via.placeholder.com/50");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController?.addImage(name, list);
  }

  // /// Adds a network image to the currently displayed style
  // Future<void> addImageFromUrl(String name, String url) async {
  //   var response = await http.get(url);
  //   return mapController?.addImage(name, response.bodyBytes);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: CustomColors.naranja_100.withOpacity(0.7)),
        child: SafeArea(
          child: Stack(
            children: [
              crearMapa(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30))),
                      disabledColor: CustomColors.gris_100,
                      elevation: 0,
                      color: CustomColors.naranja_100,
                      child: Container(
                        width: 50,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        child: Center(
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: CustomColors.blanco,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    Spacer(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      disabledColor: CustomColors.gris_100,
                      elevation: 0,
                      color: CustomColors.naranja_100,
                      child: Container(
                        width: 50,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        child: Center(
                          child: Icon(
                            Icons.alt_route_rounded,
                            color: CustomColors.blanco,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Símbolos
        // FloatingActionButton(
        //     child: Icon(Icons.sentiment_very_dissatisfied),
        //     onPressed: () {
        //       mapController?.addSymbol(SymbolOptions(
        //           geometry: center,
        //           iconSize: 2,
        //           iconImage: 'assetImage',
        //           textField: 'Montaña creada aquí',
        //           textOffset: Offset(0, 2)));
        //     }),

        // SizedBox(height: 5),

        // ZoomIn
        // FloatingActionButton(
        //     child: Icon(Icons.zoom_in),
        //     onPressed: () {
        //       mapController?.animateCamera(CameraUpdate.zoomIn());
        //     }),

        // SizedBox(height: 5),

        // ZoomOut
        // FloatingActionButton(
        //     child: Icon(Icons.zoom_out),
        //     onPressed: () {
        //       mapController?.animateCamera(CameraUpdate.zoomOut());
        //     }),

        // SizedBox(height: 5),

        // Cambiar Estilos
        FloatingActionButton(
            backgroundColor: CustomColors.azul_100,
            elevation: 4,
            child: Icon(Icons.map_outlined, color: CustomColors.blanco),
            onPressed: () {
              if (selectedStyle == oscuroStyle) {
                selectedStyle = streetStyle;
              } else {
                selectedStyle = oscuroStyle;
              }
              _onStyleLoaded();
              setState(() {});
            })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      accessToken:
          'sk.eyJ1IjoiaHVmZmxldm90b20iLCJhIjoiY2t3cGJwbGw2MGI0eTJubnppNnR6a2VuMiJ9.fgSLZx6wPQPqAL_pHGsoRQ',
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
    );
  }
}
