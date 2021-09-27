import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[850],
      body: buildAppBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Text(
        "Cadastro de avicultor",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget buildAppBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outlined,
              color: Colors.white70,
              size: 150,
            ),
            buildTextFormField("Nome", nameController, "Insira seu nome"),
            buildTextFormField("Idade", ageController, "Insira sua idade"),
            buildTextFormField(
                "Localização", adressController, "Insira seu endereço"),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String label, TextEditingController controller, String message) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return message;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white70,
          ),
        ),
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            buildDialog();
          }
        },
        child: Text(
          "Cadastrar",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[900],
          ),
        ),
      ),
    );
  }

  buildDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text(
            "Avicultor cadastrado",
            style: TextStyle(color: Colors.white70),
          ),
          content: Text(
            nameController.text +
                ", " +
                ageController.text +
                ", " +
                adressController.text,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  nameController.text = "";
                  ageController.text = "";
                  adressController.text = "";
                  Navigator.pop(context);
                },
                child: Text("OK"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey[900],
                  ),
                )),
          ],
        );
      },
    );
  }
}
