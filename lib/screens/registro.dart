import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class RegistroWidget extends StatefulWidget {
  const RegistroWidget({Key? key}) : super(key: key);

  @override
  _RegistroWidgetState createState() => _RegistroWidgetState();
}

class _RegistroWidgetState extends State<RegistroWidget> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late FocusNode _focusNode1;
  late FocusNode _focusNode2;
  late FocusNode _focusNode3;
  bool _checkboxValue = true;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    _textController1 = TextEditingController();
    _focusNode1 = FocusNode();

    _textController2 = TextEditingController();
    _focusNode2 = FocusNode();

    _textController3 = TextEditingController();
    _focusNode3 = FocusNode();

    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        _isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_focusNode1.canRequestFocus) {
          _focusNode1.requestFocus();
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF101213),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 670,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 32, 0, 8),
                              child: Text(
                                'Para comenzar...',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  color: Color(0xFF101213),
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            buildTextFormField(
                              controller: _textController1,
                              focusNode: _focusNode1,
                              labelText: 'Name',
                            ),
                            buildTextFormField(
                              controller: _textController2,
                              focusNode: _focusNode2,
                              labelText: 'Email Address',
                            ),
                            buildTextFormField(
                              controller: _textController3,
                              focusNode: _focusNode3,
                              labelText: 'Phone number',
                            ),
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: const Color(0xFF57636C),
                              ),
                              child: CheckboxListTile(
                                value: _checkboxValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _checkboxValue = newValue ?? false;
                                  });
                                },
                                title: const Text(
                                  'I would like to receive inspriation emails.',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                tileColor: Colors.white,
                                activeColor: const Color(0xFF101213),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!(MediaQuery.of(context).viewInsets.bottom > 0 ||
                      _isKeyboardVisible))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 24),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/inicio_carrito');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF101213),
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textCapitalization: TextCapitalization.words,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            color: Color(0xFF57636C),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE0E3E7),
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF4B39EF),
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 16, 16, 8),
        ),
        style: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          color: Color(0xFF101213),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 3,
        ),
        // Add your validator logic here
      ),
    );
  }
}
