import 'package:flutter/material.dart';

//Sera el encargado de reutilizar
class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  //Label fue recibido como párametro del contructor
  final String _label;
  //recibimos como parámetro del constructor un controlador que ser, nombre, apellido o telefóno
  TextBox(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      //sera nuestro textfield
      padding: EdgeInsets.all(10.0), //Algunos Style
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this._label,
            suffix: GestureDetector(
              //Se crea la opción de borrar todo lo que esta en la X
              child: Icon(Icons.close),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}
