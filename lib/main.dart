
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
      title: 'IMC',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  
  TextEditingController weightController = TextEditingController();
  TextEditingController heighController = TextEditingController();
  
  String _infoText = "Informe seus dados";

  void _resetFields(){
    setState((){
    weightController.text = "";
    heighController.text = "";
    _infoText = "Informe seus dados";
  });
  }
  void _calculate(){
    setState((){
    double weight = double.parse(weightController.text);
    double heigh = double.parse(heighController.text) / 100;
    double imc = weight / (heigh * heigh);
    if(imc < 18.6){
      _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 18.6 && imc < 24.9){
      _infoText = "Peso ideal (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 24.9 && imc < 29.9){
      _infoText = "Levemente acima (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 29.9 && imc < 34.9){
      _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 34.9 && imc < 39.9){
      _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 40){
      _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon:Icon(Icons.refresh),
              onPressed: _resetFields,
          )
        ]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
         child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline,size:120.0, color:Colors.green),
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText:"Peso (kg)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green,fontSize: 25.0),
            controller: weightController
          ),
           TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText:"Altura (cm)",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green,fontSize: 25.0),
            controller: heighController
          ),
         Padding(
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child:Container(
           height:50.0,
           child: RaisedButton(
            onPressed:_calculate,
            child: Text("Calcular",style: TextStyle(color: Colors.white, fontSize: 25.0)),
            color: Colors.green,
            )
          ),
         ),
         Text(_infoText,
         textAlign: TextAlign.center,
         style: TextStyle(color: Colors.green, fontSize:25.0))
        ]
      )
      ),
    );
  }
}