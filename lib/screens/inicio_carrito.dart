import 'package:appcobro_1/components/Navbar_allscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class InicioCarritoWidget extends StatefulWidget {
  const InicioCarritoWidget({Key? key}) : super(key: key);

  @override
  _InicioCarritoWidgetState createState() => _InicioCarritoWidgetState();
}

class _InicioCarritoWidgetState extends State<InicioCarritoWidget> {
  late List<CameraDescription> cameras;
  late CameraController?
      cameraController; // Usamos "?" para permitir que sea nulo
  late Future<void> cameraControllerInitialize;

  String barcodeData = "";

  @override
  void initState() {
    super.initState();
    cameraControllerInitialize = initCamera();
  }

  Future<void> initCamera() async {
    // Verificar permisos
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await cameraController!.initialize();
    } else {
      if (await Permission.camera.request().isGranted) {
        // Si el usuario concede los permisos, inicializar la cámara
        cameras = await availableCameras();
        cameraController = CameraController(
          cameras[0],
          ResolutionPreset.medium,
        );
        await cameraController!.initialize();
      } else {
        // Puedes mostrar un mensaje al usuario informándole sobre la necesidad de los permisos
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> scanBarcodeWithCamera() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancelar",
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        barcodeData = result;
      });
    } on PlatformException {
      barcodeData = 'Error al escanear';
    }
  }

  Widget _buildBarcodeReader() {
    return GestureDetector(
      onTap: () async {
        await cameraControllerInitialize;
        scanBarcodeWithCamera();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 300,
            height: 200,
            child: FutureBuilder<void>(
              future: cameraControllerInitialize,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(cameraController!);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 35, 10, 0),
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
          const Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 86, 0, 0),
              child: NavBarWithMiddleButtonWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
