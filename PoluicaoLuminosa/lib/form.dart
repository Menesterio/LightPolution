import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'mysql.dart';
import 'homepage.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  double lat = 0.0;
  double lon = 0.0;
  double pol = 0;
  var db = new Mysql();
  var test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form',
          textAlign: TextAlign.center,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents horizontally,
            children: [
              Text(
                'Light Pollution value',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Slider(
                value: pol,
                max: 7,
                divisions: 7,
                label: pol.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    pol = value;
                  });
                },
              ),
              Text(
                'Latitude: $lat',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              ),
              Text(
                'Longitude: $lon',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents horizontally,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      getPos();
                    },
                    child: Text('Get Coordinates'),
                  ),
                  Container(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Postdb();

                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPos() async {
    Position pos = await Geolocator.getCurrentPosition();
    setState(
      () {
        lat = pos.latitude;
        lon = pos.longitude;
      },
    );
    print(pos);
    print(pol);

  }

  Postdb() async {
    db.getConnection().then((conn) {
      String sql =
          'insert into reports (lat, lon, pol) values ($lat, $lon, $pol)';
      conn.query(sql).then((results) {});
    });
    Navigator.pop(context);
  }
}
