import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aplicacionbasica extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Aplicacionbasica();
  }
}

class _Aplicacionbasica extends State<Aplicacionbasica>{
  int _selectedOption = 1; // opción por defecto
  final nombre = TextEditingController();
  final cantidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Reservación Restaurante"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            nombre.text = "";
            cantidad.text = "";
          }, icon: Icon(Icons.recycling), iconSize: 35,)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text("Haga su reservacion ahora", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,),
          SizedBox(height: 80,),
          TextField(decoration: InputDecoration(labelText: "A nombre de quien:", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),controller: nombre,),
          SizedBox(height: 30,),
          TextField(decoration: InputDecoration(labelText: "Cantidad de personas", border: OutlineInputBorder(), prefixIcon: Icon(Icons.people)),controller: cantidad,),
          SizedBox(height: 40,),
          RadioListTile(
            title: Text("Reservación de Dia"),
            value: 1,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: Icon(Icons.sunny),
          ),
          RadioListTile(
            title: Text("Reservación de Noche"),
            value: 2,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            secondary: Icon(Icons.dark_mode),
          ),
          SizedBox(height: 80,),
          ElevatedButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Reservado"),
                content: Text("Reservacion hecha satisfactoriamente"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Aceptar"))
                ],
              );
            });
          }, child: const Text("Reservar"),
             style: ElevatedButton.styleFrom(
               fixedSize: Size(5, 50),
             ),),
        ],
      )
    );
  }

}