import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget {
  @override
  _WeightOnPlanetState createState() => _WeightOnPlanetState();
}

class _WeightOnPlanetState extends State<WeightOnPlanet> {
  int radioValue=0;
  double _finalResult=0.0;
  final TextEditingController _weightController= new TextEditingController();
  String _formattedText="";
  void handleRadioValueChanged(int value){
    setState(() {
     radioValue=value;
     switch (radioValue) {
       case 0:_finalResult=calculateWeight(_weightController.text,0.06);
        _formattedText="Your weight on pluto is ${_finalResult.toStringAsFixed(1)}";
       break;
       case 1:_finalResult=calculateWeight(_weightController.text,0.38) ;
       _formattedText="Your weight on mars is ${_finalResult.toStringAsFixed(1)}";
       break;
       case 2:_finalResult=calculateWeight(_weightController.text,0.91) ;
       _formattedText="Your weight on venus is ${_finalResult.toStringAsFixed(1)}";
       break;
       

            }
           });
         }
         @override
         Widget build(BuildContext context) {
           return Scaffold(
             appBar: AppBar(
               title: Text("Weight On Planet"),
               centerTitle: true,
               backgroundColor: Colors.deepPurpleAccent,
             ),
             body: Container(
               alignment: Alignment.topCenter,
               child: ListView(
                 padding: const EdgeInsets.all(2.5),
                 children: <Widget>[
                   Image.asset("images/planet.png.png",height: 133.0,width: 200.0,),
                   Container(
                     margin: const EdgeInsets.all(3.0),
                     alignment: Alignment.center,
                     
                     child: Column(
                       children: <Widget>[
                         new TextField(
                           controller: _weightController,
                           keyboardType: TextInputType.number,
                           decoration: new InputDecoration(
                             labelText: "Weight on Earth",
                             hintText: "In Pounds",
                             icon: Icon(Icons.person_outline)
                           ),
                         ),
                         Padding(padding: EdgeInsets.all(5.0)),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Radio<int>(value:0 ,groupValue:radioValue ,onChanged:handleRadioValueChanged ,activeColor: Colors.brown,),
                             new Text("Pluto",style: TextStyle(color: Colors.black),),
                             Radio<int>(value:1 ,groupValue:radioValue ,onChanged:handleRadioValueChanged ,activeColor: Colors.red,),
                             new Text("Mars",style: TextStyle(color: Colors.black),),
                             Radio<int>(value:2 ,groupValue:radioValue ,onChanged:handleRadioValueChanged ,activeColor: Colors.orangeAccent,),
                             new Text("Venus",style: TextStyle(color: Colors.black),
                             )
                           ],
       
                         ),
                         Padding(padding: EdgeInsets.all(15.6),),
                         new Text(
                           _weightController.text.isEmpty?"Please enter weight":_formattedText+"lbs",
                           
                           style: TextStyle(fontSize: 19.4,fontWeight: FontWeight.w500)
                         )
                       ],
                     ),
                   )
                 ],
               ),
             )
           );
         }
       
         double calculateWeight(String weight, double multiplier) {
           if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
             return int.parse(weight) * multiplier;
           }
           else{
             print("wrong weight");
           }
           return int.parse("180")*0.38;
         }
}
