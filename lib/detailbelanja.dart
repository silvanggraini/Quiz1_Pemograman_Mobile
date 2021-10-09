import 'package:flutter/material.dart';
import 'package:flutter_application_quiz1/main.dart';

class DetailBelanja extends StatefulWidget {
  final int detail;
  final List data;
  const DetailBelanja({ Key? key , required this.detail, required this.data}) : super(key: key);

  @override
  DetailBelanjaState createState() => DetailBelanjaState();
}


class DetailBelanjaState extends State<DetailBelanja> {
  void setJumlahbrg(data, detail, operasi) {
    if (operasi == true) {
      data[detail]["jumlah_brg"] = data[detail]["jumlah_brg"] + 1;
    }
    else {
      data[detail]["jumlah_brg"] = data[detail]["jumlah_brg"] - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Belanja"),
        backgroundColor: Colors.green,),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(widget.data[widget.detail]["image"].toString()),
                  fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                  )
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Text(widget.data[widget.detail]["nama_barang"].toString() ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                        Text("Rp. " + widget.data[widget.detail]["harga_brg"].toString(), 
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),),
                        Text(widget.data[widget.detail]["deskripsi"].toString())
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        height: 30,
                        minWidth: 30,
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (!(widget.data[widget.detail]["jumlah_brg"] <= 0)) {
                              setJumlahbrg(widget.data, widget.detail, false);
                            }
                          });
                        }),
                        Container(
                          height: 30,
                          width: 100,
                          child: Center(
                            child: Text(widget.data[widget.detail]["jumlah_brg"].toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),)),
                        ),
                        MaterialButton(
                        height: 30,
                        minWidth: 30,
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            setJumlahbrg(widget.data, widget.detail, true);
                          });
                        })
                    ],
                  ),
                  MaterialButton(
                    height: 30,
                    minWidth: 30,
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Konfirmasi"),
                    onPressed: () {
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(
                        builder: (context) => MyApp(counter: widget.data[widget.detail]["jumlah_brg"],
                        index: widget.detail,)));
                    })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}