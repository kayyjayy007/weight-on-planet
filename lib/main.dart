import 'package:flutter/material.dart';

import 'ui/Weight_On_Planet.dart';

void main(){
 runApp(
   wop()
    );
   }
   
   class wop extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: "Weight On planet",
         home: WeightOnPlanet(),
        
       );
     }
   }