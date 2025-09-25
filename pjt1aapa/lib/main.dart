import 'package:flutter/material.dart';

void main() {
  runApp(

    MaterialApp(home: Home(),
    debugShowCheckedModeBanner: false,)
  );
}

class Home extends StatefulWidget {

  @override
  _HomeState createState()=> _HomeState();
  
}

class _HomeState extends State<Home>{
  
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController =TextEditingController();
  String _resultado = "Informe os valores";


  void _calcularCombus(){
    setState(() {

      double vAlcool = double.parse(alcoolController.text.replaceAll(',', '.'));
      double vGasol = double.parse(gasolinaController.text.replaceAll(',', '.'));
      double propoc = vAlcool/vGasol;

    if (propoc< 0.7) {
      _resultado = "Abasteça com Alcool.";
      
    } else {
      _resultado = "Abasteça com Gasolina.";
      
    }
      
    });
    
  }
  
  

  @override
  Widget build(BuildContext BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: const Color.fromARGB(255, 230, 228, 223)
          ),

        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 142, 203, 211),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh)
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Form(child: Column(
          children: <Widget>[
            Icon(Icons.local_gas_station,
            size: 140,
            color: Colors.amberAccent),
            TextFormField(
              controller: alcoolController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor alcool",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 62, 214, 70))
              ),
              style: TextStyle(
                color: Colors.amber,
                fontSize: 26,        
              ),
            ),
             TextFormField(
              controller: gasolinaController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor Gasolina",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 44, 29, 1))
              ),
              style: TextStyle(
                color: Colors.amber,
                fontSize: 26,        
              ),
            ),

            Padding(padding: EdgeInsets.only(top:20, bottom: 20),
            child: Container(
              height: 50,
              child: ElevatedButton(onPressed: (){
                _calcularCombus();

              }, child: Text("Verificar",

              style: TextStyle(
                color: Colors.blue,
                fontSize: 25
             

              ),


              )),
            
            ),
            ),

            Text(_resultado,

            textAlign: TextAlign.center,
            style: TextStyle(

              color: Colors.deepOrange,
              fontSize: 25,

            ),
            
            ),


            

    







            
          ],
        )),
      )

   );

  }

}