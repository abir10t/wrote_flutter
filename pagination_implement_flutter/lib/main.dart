import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int  totalPages;
  int currentPage = 1;
  List passengers = [];

  final RefreshController refreshController = RefreshController(initialRefresh: true);
  Future<bool> getPassengerData({ bool isRefresh = false  }) async{
        if( isRefresh ){ currentPage = 1;}
        else{
          if( currentPage >= totalPages){
              refreshController.loadNoData();
              return false;
          }

        }

        final Uri uri = Uri.parse("https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");
        final response = await  http.get(uri);
        if ( response.statusCode ==200 ){
          final result = jsonDecode(response.body);
          if( isRefresh ){
            passengers = result["data"];
          }
          else{
            passengers.addAll(result["data"]);
          }

          currentPage++;
          totalPages = result["totalPages"];
          setState(() {});
          print(response.body);
          return true;
        }
        else{
          return false;
        }

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("initial List pagination"),
       ),
       body: SmartRefresher(
         enablePullUp: true,
         controller: refreshController,
         onRefresh: ()async{
               final result = await getPassengerData(isRefresh:  true);
               if( result ){
                 refreshController.refreshCompleted();
               }
               else{
                 refreshController.refreshFailed();
               }

         },

          onLoading: ()async{
            final result = await getPassengerData();
            if( result ){
              refreshController.loadComplete();
            }
            else{
              refreshController.loadFailed();
            }


          },



         child: ListView.separated(
            itemBuilder: (context, index){

              final passenger = passengers[index];
              return ListTile(
                title: Text(passengers[index]["name"]),
              );

            },
           separatorBuilder: (context, index) => Divider(),
            itemCount: passengers.length,
         ),
       ),

     );
  }
}

