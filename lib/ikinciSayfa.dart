
import 'package:flutter/material.dart';

class ikinciSayfa extends StatefulWidget {

  String ulke;


  ikinciSayfa(this.ulke);

  @override
  State<ikinciSayfa> createState() => _ikinciSayfaState();
}

class _ikinciSayfaState extends State<ikinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("İkinci sayfa"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${widget.ulke}",style: TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
    );
  }
}
