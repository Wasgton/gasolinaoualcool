import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _resultado = '';
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  _calc(){

    double? gasolina = double.tryParse(_controllerGasolina.text);
    double? alcool = double.tryParse(_controllerAlcool.text);


    if(gasolina==null || alcool ==null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Os valores digitados estão em um formato incorreto'),
      ));
    }else{

      if((alcool/gasolina) >=0.7){
        setState(() {
          _resultado = 'É mais vantajoso usar alcool';
        });
      }else{
        setState(() {
          _resultado = 'É mais vantajoso usar gasolina';
        });
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset('lib/assets/images/logo.png'),
                ),
                Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Preço Alcool. Ex.:3.15',

                      ),
                      controller: _controllerAlcool,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Preço Gasolina. Ex.:3.15'
                      ),
                      controller: _controllerGasolina,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: ElevatedButton(
                    child: Text('Calcular'),
                    onPressed: (){
                      _calc();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Text('Resultado: $_resultado'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
