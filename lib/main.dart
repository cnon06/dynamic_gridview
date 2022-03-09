import 'package:flutter/material.dart';
import 'package:untitled39/ikinciSayfa.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {






  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var ulkeler = ["Almanya","Türkiye","Yunanistan","Kenya","Tanzanya","Kanada","Japonya","Çin","Rusya"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2/1,
      ),
          itemCount: ulkeler.length,
          itemBuilder: (context,index)
      {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ulkeler[index]),
                Spacer(),

                PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Sil",style: TextStyle(color: Colors.red),),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("Güncelle",style: TextStyle(color: Colors.indigo),),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text("Git",style: TextStyle(color: Colors.indigo),),
                    ),
                  ],
                  onCanceled: ()
                  {
                    print('Seçim iptal edildi.');
                  },
                  onSelected: (menuItemValue)
                  {
                    switch(menuItemValue)
                    {
                      case 1:
                        print('Sil seçildi.');
                        setState(() {
                          ulkeler.removeAt(index);
                        });
                        break;
                      case 2:
                        print('Güncelle seçildi.');
                        break;
                      case 3:
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ikinciSayfa(ulkeler[index])));
                       // print('Güncelle seçildi.');
                        break;

                    }
                  },


                ),

                /*
                 TextButton(onPressed: ()
                    {
                      print('${ulkeler[index]} seçildi.');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ikinciSayfa(ulkeler[index])));
                          }, child: Text("Ülke Seç", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
                 */

              ],
            ),
          ),
        );
      })

    );
  }
}
