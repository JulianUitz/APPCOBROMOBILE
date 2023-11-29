import 'package:appcobro_1/components/Navbar_allscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';

class InicioCarritoWidget extends StatefulWidget {
  const InicioCarritoWidget({Key? key}) : super(key: key);

  @override
  _InicioCarritoWidgetState createState() => _InicioCarritoWidgetState();
}

Widget _buildBarcodeReader() {
  return BarcodeWidget(
    barcode: Barcode.code93(),
    width: 300,
    height: 200,
    color: Colors.black,
    data: 'CODE93',
    backgroundColor: Colors.white,
  );
}

class _InicioCarritoWidgetState extends State<InicioCarritoWidget> {
  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                  child: Text(
                    'BIENVENIDO A TU \nCARRITO DE COMPRAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: _buildBarcodeReader(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 70, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Text(
                      'ESCANEA UN PRODUCTO\nPARA AGREGAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [],
          ),
          const Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 86, 0, 0),
              child: NavBarWithMiddleButtonWidget(), // Reemplazar con tu widget
            ),
          ),
        ],
      ),
    );
  }
}
