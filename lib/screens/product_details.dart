import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appcobro_1/components/Navbar_allscreens.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
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

    return GestureDetector(
      onTap: () {
        // Handle tap to unfocus logic if needed
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1553456558-aff63285bdd1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxwcm9kdWN0fGVufDB8fHx8MTcwMDgxMjczOHww&ixlib=rb-4.0.3&q=80&w=1080',
                            width: 300,
                            height: 275,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.00, 0.00),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Nombre del Producto',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Código del Producto',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Precio Unitario',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Peso',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              NavBarWithMiddleButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
