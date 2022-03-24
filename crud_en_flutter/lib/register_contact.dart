import 'package:crud_en_flutter/my_home_page.dart';
import 'package:crud_en_flutter/text_box.dart';
import 'package:flutter/material.dart';

//Se crea este archivo para poder tener todos los registros de los clientes.

class RegisterContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  //Se declara controladores para cada campo de texto
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  void initState() {
    //Aqui lo inicializamos
    controllerName = new TextEditingController();
    controllerSurname = new TextEditingController();
    controllerPhone = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Nuevo Usuario"),
      ),
      body: ListView(
        children: [
          //Se llama el textBox reutilizable y le enviamos el controlador y el label que resive parámetros
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Teléfono"),
          ElevatedButton(
              onPressed: () {
                //tenemos información de cada cliente
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  //validamos que no esten vacios los campos
                  Navigator.pop(context,
                      new Client(name: name, surname: surname, phone: phone));
                }
              },
              child: Text("Guardar Contácto"))
        ],
      ),
    );
  }
}
