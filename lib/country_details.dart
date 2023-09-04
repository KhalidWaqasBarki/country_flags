import 'package:country_flags/country%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetails extends StatelessWidget {
  var country;
  CountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
            child: Text(
          country.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3, color: Colors.black87),
              ),
                width: double.infinity,
                height: 200,
                child: Hero(
                  tag: country.name,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.network(

                      country.flag,
                   fit: BoxFit.fill,
                    ),
                  ),
                )),
          ),
          SizedBox(width: 15,),
          Text(country.iso3),
          SizedBox(height: 15,),
          Text(country.iso2),
        ],
      ),
    );
  }
}
