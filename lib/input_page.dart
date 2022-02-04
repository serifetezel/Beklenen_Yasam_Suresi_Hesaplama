import 'package:beklenen_yasam_suresi_app/constant.dart';
import 'package:beklenen_yasam_suresi_app/result_page.dart';
import 'package:beklenen_yasam_suresi_app/user_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String ?seciliCinsiyet;
  double icilenSigara = 0.0; // Program ilk çalıştığı anda slider'ın gösterileceği konum
  double sporGunu = 0.0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('YAŞAM BEKLENTİSİ', style: TextStyle(color: Colors.black54)),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: MyContainer(child: builRowOutlineButton('BOY'))),
                Expanded(child: MyContainer(child: builRowOutlineButton('KİLO')))
              ],
            )),
            Expanded(child: MyContainer(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Haftada kaç gün spor yapıyorsunuz?', style: kMetinStili),
                Text('${sporGunu.round()}', style: kSayiStili),
                Slider(
                  min: 0,
                  max: 7,
                  divisions: 7,
                  value: sporGunu,
                  onChanged: (double newValue){
                    setState(() {
                      sporGunu = newValue;
                    });
                  },
                )
              ],
            ))),
            Expanded(
              child: MyContainer(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Günde kaç sigara içiyorsunuz?',style: kMetinStili),
                  Text('${icilenSigara.round()}',//icilenSigara.round().toString()
                        style: kSayiStili),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue){
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                    },
                    child: MyContainer(
                      
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.lightBlue[100]!
                          : Colors.white,
                          
                      child: IconCinsiyet(
                          cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                        setState(() {
                          seciliCinsiyet = 'ERKEK';
                        });
                      },
                    child: MyContainer(
                      
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.lightBlue[100]!
                          : Colors.white,
                  
                      child: IconCinsiyet(
                          cinsiyet: 'ERKEK', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                )
              ],
            )),
          
          ButtonTheme(
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                  UserData(kilo: kilo,boy: boy,seciliCinsiyet: seciliCinsiyet,sporGunu: sporGunu,icilenSigara: icilenSigara)
                )));
              },
              child: Text('HESAPLA', style: kMetinStili,)
            ),
          )
          ],
        ));
  }

  Row builRowOutlineButton(String label) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RotatedBox(
                    quarterTurns: -1,
                    child: new Text(label,style: kMetinStili)),
                  
                  new RotatedBox(
                    quarterTurns: -1,
                    child: new Text(
                      label == 'BOY' ? boy.toString() : kilo.toString(), style: kSayiStili
                    )
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 36.0,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.lightBlue)),
                          onPressed: (){
                            setState(() {
                              label == 'BOY' ? boy++ : kilo++;
                            });

                            print('üstteki buton basıldı.');
                          }, 
                          child: Icon(FontAwesomeIcons.plus, size: 10, color: Colors.black)
                        ),
                      ),
                      SizedBox(width: 10),
                      ButtonTheme(
                        minWidth: 36.0,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.lightBlue)),
                          onPressed: (){
                            setState(() {
                              label == 'BOY' ? boy-- : kilo--;
                            });

                            print('alttaki buton basıldı.');
                          }, 
                          child: Icon(FontAwesomeIcons.minus, size: 10, color: Colors.black)
                        ),
                      )
                    ],
                  )
                ],
              );
               

  }
 
}
