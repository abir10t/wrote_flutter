import 'package:flutter/material.dart';
import 'package:search/search_location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedPlace ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'search Delegate class',
             style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,

      ),
      body: Column(
        children: [
          OutlinedButton.icon(
            label: Text('search'),
            icon: Icon(Icons.search), onPressed: () {
              showSearch(context: context, delegate: SearchLocations(allCaliforniaPlaces: allCaliforniaPlaces, californiaPlacesSuggestion: popularCaliforniaPlaces));
          },


          ),

          selectedPlace == '' ? Container() : Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15.0),
            color: Colors.deepOrange,
            child: Text(
              selectedPlace,
              style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: allCaliforniaPlaces.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(allCaliforniaPlaces[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

final List<String> allCaliforniaPlaces = [
  'alambed',
  'alhambra',
  'fegf',

];

final List<String> popularCaliforniaPlaces = [
  'Anhemin',
  'Belcon',
  'Brakely',
  'Bervely hills',
  'Burkbank',


];
