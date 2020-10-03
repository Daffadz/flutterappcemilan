import 'package:flutter/material.dart';
import 'package:flutterappcemilan/detail.dart';

//daffa hactoberfest 2020

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Dessert"),
        ),
        body: _PageList());
  }
}
//class
class _PageList extends StatefulWidget {
  _PageStateListState createState() => _PageStateListState();
}

class _PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Berry Crumble",
    "Blueberry Cake",
    "Cookie",
    "Es Kopi",
    "Lasagna"
  ];

  List<String> subjudul = [
    "Roti lembut dengan taburan topping berry",
    "Kue dengan selai blue berry nan lembut",
    "Biskuit lemut aneka macam",
    "Kopi dengan es yang menyegarkan",
    "Makanan yang disukai sekali oleh garfield"
  ];

  List<String> gambar = [
    "images/berrycrumble.jpeg",
    "images/blueberrycake.jpg",
    "images/cookie.jpg",
    "images/eskopi.jpg",
    "images/lasagna.jpg"
  ];
  List<String> stok = ["14 buah", "14 buah", "14 buah", "14 buah", "14 buah"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext contex, int index) {
          final title = judul[index].toString();
          final subTitle = subjudul[index].toString();
          final jmlah = stok[index].toString();
          final img = gambar[index].toString();
          return Container(
            height: 200,
            padding: EdgeInsets.all(8),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                    child: topContent(title, subTitle, jmlah),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              itemJudul: title,
                              itemSub: subTitle,
                              qty: jmlah,
                              itemImage: img,
                            )));
              },
            ),
          );
        },
      ),
    );
  }
}

backgroundImage(String gambar) {
  return new Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar))),
  );
}

topContent(String nama, String deskripsi, String stok) {
  return new Container(
    height: 80,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          nama,
          style: bigHeaderText,
        ),
        Text(
          deskripsi,
          style: descHeaderText,
        ),
        Container(
          height: 2,
          width: 80,
          color: Colors.redAccent,
        ),
        Text(
          stok,
          style: footerHeaderText,
        )
      ],
    ),
  );
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');

final bigHeaderText =
    baseTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold);

final descHeaderText =
    baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w400);

final footerHeaderText =
    baseTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
