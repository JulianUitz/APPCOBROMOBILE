import 'package:appcobro_1/components/Navbar_allscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagoTypeWidget extends StatefulWidget {
  const PagoTypeWidget({Key? key}) : super(key: key);

  @override
  _PagoTypeWidgetState createState() => _PagoTypeWidgetState();
}

class _PagoTypeWidgetState extends State<PagoTypeWidget> {
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
      appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor, // Cambia de `primary` a `primaryColor`
        automaticallyImplyLeading: false,
        title: const Text(
          'ELIJA SU FORMA DE PAGO...',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 100, 40, 40),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'PAGO EN CAJA',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(80, 80, 80, 80),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'PAGO EN LINEA',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
              child: NavBarWithMiddleButtonWidget(), // Reemplazar con tu widget
            ),
          ),
        ],
      ),
    );
  }
}
