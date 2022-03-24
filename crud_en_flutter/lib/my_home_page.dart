import 'package:crud_en_flutter/message_response.dart';
import 'package:crud_en_flutter/modify_contact.dart';
import 'package:crud_en_flutter/register_contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  // ignore: use_key_in_widget_constructors
  const MyHomePage(this._title);
  //recibimos el titulo en el contructor de la clase
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  //Damos creación a nuestra clase principal
  List<Client> clients = [
    //creamos una lista con nuestros clientes
    Client(name: 'will', surname: 'Mora', phone: '3209979113'),
    Client(name: 'Santiago', surname: 'Ramirez', phone: '3132758685'),
    Client(name: 'carlos', surname: 'patillo', phone: '3132700076'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyContact(clients[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    clients.removeAt(index);

                    clients.insert(index, newContact);
                    messageResponse(
                        context,
                        newContact.name +
                            " " +
                            newContact.surname +
                            " " +
                            "A sido actualizado");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, clients[index]);
            },
            title: Text(clients[index].name + " " + clients[index].surname),
            subtitle: Text(clients[index].phone),
            leading: CircleAvatar(
              child: Text(clients[index].name.substring(
                  0, 1)), //colocamos la opción del icono de cada contacto
            ),
            trailing: const Icon(
              Icons.youtube_searched_for,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  //llamamos la clase registercontac
                  context,
                  MaterialPageRoute(builder: (_) => RegisterContact()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                //se añade el cliente a la lista.
                clients.add(newContact);
                messageResponse(
                    context,
                    newContact.name +
                        " " +
                        newContact.surname +
                        " " +
                        "Se agrego a nuestra base de datos");
              });
            }
          });
        },
        tooltip: "Agregar Usuario",
        child: Icon(Icons.add),
      ),
    );
  }

  removeClient(BuildContext context, Client client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text("Esta seguro de eliminar a" + client.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.clients.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ));
  }
}

class Client {
  //damos creación de la clase cliente
  var name;
  var surname;
  var phone;

  Client({this.name, this.surname, this.phone});
}
