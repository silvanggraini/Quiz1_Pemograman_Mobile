import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz1/detailbelanja.dart';

void main() {
  runApp(MyApp(
    counter:2,
    index :1,
  ));
}

class MyApp extends StatefulWidget {
  final int counter, index;
  const MyApp({ Key? key, required this.counter, required this.index }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String,dynamic>> listBelaja = [
    {
      "nama_brg" : "Masker Earloop 3 play",
      "harga_brg" : 14000,
      "jumlah_brg" : 3,
      "image" : "img/pic_masker.jpg",
      "deskripsi" : "Masker 3ply izin kemenkes No. FR.03.02/VA/13568/2021 Chasa, Size: 17,5cm x 9,5 cm, material: non-woven 70% + melt-blown 30%"
    },
    {
      "nama_brg" : "[Twin Pack] Gurita Pembersih",
      "harga_brg" : 15000,
      "jumlah_brg" : 1,
      "image" : "img/pic_twinpack.png",
      "deskripsi" : "Fitur Alat Pembersih muka dengan bentuk gurital lucu, Terbuat dari silikon berkualitas. Terdapat spons di bagian dalam untuk memudahkan membuat busa dari sabun cuci muka"
    },
    {
      "nama_brg" : "NEOGEON BIO PEEL",
      "harga_brg" : 9999,
      "jumlah_brg" : 4,
      "image" : "img/pic_neogeon.jpg",
      "deskripsi" : "NEOGEON BIOPLEEL LEMON WINE GREETEA shaer in sachet 100% original harga 8.000 per pad/lembar Bio Peel Gauze Peeling Green Tea membersihkan kulit secara mekanis dan bahan bahan alami"
    },
  ];
 
  num total = 0;
  setTotal(listBelaja, index, counter) {
    num initTotal = 0;
    listBelaja[index]["jumlah_brg"] = counter ;
    for (int i =0; i < listBelaja.length; i++) {
      initTotal = initTotal + ((listBelaja[i]["harga_brg"]) * (listBelaja[i]["jumlah_brg"]));
    }
    total = initTotal;
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keranjang Belanja"),
          backgroundColor: Colors.lightGreen[600],
        ),
        body: ListView.builder(
          itemCount: listBelaja.length,
          itemBuilder: (context,index ) {
            return Container(
          height: 150,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Row(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(listBelaja[index]["image"].toString()),
                    fit: BoxFit.cover),
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsetsDirectional.fromSTEB(15,5,5,15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(listBelaja[index]["nama_brg"].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                      Text("Rp. " + listBelaja[index]["harga_brg"].toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                      ),),
                      Text("Jumlah : " + listBelaja[index]["jumlah_brg"].toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text("Lihat Detail"),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute
                            (builder: (context) => DetailBelanja(
                              detail: index,
                              data: listBelaja,
                            ))
                          );
                        })
                    ],
                  ),
                ),)
            ],
          ),
        );
          }),
        
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.lightGreen[600],
            height: 60,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Total",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight : FontWeight.w600,
                    color: Colors.white
                  ),),
                ),
                Container(
                  child: Text("Rp. " + setTotal(listBelaja, widget.index, widget.counter) ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
                )
              ],
            ),
          ),
        ),
        ),
      
    );
  }
}