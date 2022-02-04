import 'package:beklenen_yasam_suresi_app/constant.dart';
import 'package:beklenen_yasam_suresi_app/user_data.dart';
import 'package:flutter/material.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget{
final UserData _userData;
ResultPage(this._userData);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Sonuç Sayfası')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(child: Text(
              Hesap(_userData).hesaplama().round().toString(),
              style: kMetinStili,)),),
          Expanded(
            flex: 1,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: (){
                Navigator.pop(context);
            }, 
            child: Text('GERİ DÖN',style: kMetinStili,)))
        ],
      ),
    );
  }
}