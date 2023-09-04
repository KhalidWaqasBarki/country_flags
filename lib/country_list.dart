import 'dart:convert';

import 'package:country_flags/country%20model.dart';
import 'package:country_flags/country_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

  List<CountryDet> countries = [];
  Future<List<CountryDet>> getCountries() async {
    http.Response response = await http.get(Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'),);
    var jsondecode = await jsonDecode(response.body);
    var jsonArray = await jsondecode['data'];

     for( var jsonMap in jsonArray){
       CountryDet country= CountryDet.fromJson(jsonMap);
       countries.add(country);

     }
    return countries;
  }


  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Center(child: Text('Country list',style: TextStyle(fontWeight: FontWeight.bold),)),),
backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getCountries(),

          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),

                    SizedBox(
                      height: 12,
                    ),
                    Text('Please Wait...', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: countries.length,
                itemBuilder:(context, index){
                  countries = snapshot.data!;
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CountryDetails(country: countries[index],)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Card(
                        color: Colors.cyan,
                        child:Row(

                          children: [

                            SizedBox(
                              width: 100,
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Hero(
                                    tag: countries[index].name,
                                    child: SvgPicture.network(countries[index].flag)),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(countries[index].name)
                          ],
                        ),
                      ),
                    ),
                  );

                } );
          }),
    );
  }
}
