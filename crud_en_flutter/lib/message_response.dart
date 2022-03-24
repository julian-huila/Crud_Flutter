import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//creamos este archivo para programar un mensaje informativo
messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Se agrego su perfil correctamente  "),
            content: Text("El contacto " + name),
          ));
}
