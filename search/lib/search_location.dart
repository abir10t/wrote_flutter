import 'package:flutter/material.dart';

class SearchLocations extends SearchDelegate<String>{

  final List<String> allCaliforniaPlaces;
  final List<String> californiaPlacesSuggestion;

  SearchLocations({required this.allCaliforniaPlaces, required this.californiaPlacesSuggestion});
  @override
  List<Widget>? buildActions(BuildContext context) {
        return [
          IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            query = '';
          },)
        ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
       return IconButton(
         icon: Icon(Icons.clear),
         onPressed: (){},
       );

  }

  @override
  Widget buildResults(BuildContext context) {

  final List<String> allLocations =  allCaliforniaPlaces.where((californiaplace) => californiaplace.toLowerCase().contains(query.toLowerCase(),)).toList();
  return ListView.builder(
    itemCount: allLocations.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(allLocations.elementAt(index)),
      leading: Icon(Icons.close),
    ),
  );


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> locationSuggestion =  californiaPlacesSuggestion.where((placeSuggestion) => placeSuggestion.toLowerCase().contains(
      query.toLowerCase(),
    )).toList();
    return ListView.builder(
      itemCount: locationSuggestion.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(locationSuggestion.elementAt(index)),
      ),
    );
  }


}