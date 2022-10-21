import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  var pokeApi=
      "https://dog.ceo/api/breed/hound/images"; 
  List pokedesk = [] ;
  @override
  Widget build(BuildContext context) {
        var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
   
    return Scaffold(
      
backgroundColor: Colors.black,
      
      body: Stack(

          children: [
            Positioned(
              bottom: 50,
              right: 50,
              child: Image.asset(
                "assets/img/card.png",
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                "API parcial 3",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top:80,
              left:20,
              child: Text(style: TextStyle(
                    fontSize: 18,
                    color: Colors.white),
              "Cordova Machado, Jacqueline Michelle"
            )), Positioned(
              top:100,
              left:20,
              child: Text(style: TextStyle(
                    fontSize: 18,
                    color: Colors.white),
              "Perez Lopez, William Alexander"
            )),
            Positioned(
              top: 150,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                pokedesk.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: pokedesk.length,
                        itemBuilder: (context, index) {
                          var tipo = pokedesk[index]['type'];

                        return Card(
                          child: Positioned(child: Stack(
                            children: [
                              Positioned(
                                child: CachedNetworkImage(
                                  imageUrl: pokedesk[index]['mensaje'],))
                            ],
                          ) ),
                        );

                        }
  
      
     ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )]),
            )
          ],
  ));}


 @override
 void initState() {
   super.initState();
   if(mounted){
      datosPokemon();
   }
 } 

void datosPokemon(){
  var url =
  Uri.https('dog.ceo', '/api/breed/hound/images');
  
  http.get(url).then((value) { 

    if(value.statusCode==200){ 
      var decodejsonData= jsonDecode(value.body);
      pokedesk = decodejsonData['mensaje'];
      setState(() {
        //print(pokedesk[2]['name']);
      });
 }
    //print(value.body)
         //print(decodejsonData
        
    });

  }

}