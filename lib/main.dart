import 'package:appcobro_1/screens/inicio.dart';
import 'package:appcobro_1/screens/inicio_carrito.dart';
import 'package:appcobro_1/screens/pago_type.dart';
import 'package:appcobro_1/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'screens/registro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => InicioScreen(),
        '/registro': (context) => RegistroWidget(),
        '/inicio_carrito': (context) => InicioCarritoWidget(),
        '/pago_type': (context) => PagoTypeWidget(),
        '/product_details': (context) => ProductDetailsWidget()
      },
      initialRoute: '/', // Ruta inicial

      //Aquí usas la pantalla de registro como pantalla de inicio
    );
  }
}
