import 'package:flutter/material.dart';

class WalletWidget extends StatefulWidget {
  final String title;

  WalletWidget(this.title);

  @override
  _WalletWidget createState() => _WalletWidget(title);
}

class _WalletWidget extends State<WalletWidget> {
  final String title;

  _WalletWidget(this.title);

  List<String> letters;

  List<String> dataSources;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.dataSources = <String>[
      "张三", "李四", "王五", "陈六", "徐七", "赵八", "钱九"
    ];
    this.letters = <String>[
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text(this.title),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text("title");
            },
            itemCount: this.dataSources.length,
          ),
        )
//      body: Stack(
//        children: <Widget>[
//          Center(
//            child: new Text("now, is ${this.title}"),
//          ),
//          Positioned(
//              top: 0.0,
//              bottom: 0.0,
//              width: 50.0,
//              right: 0.0,
//              child: Container(
//                margin: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height - letters.length * 22.0)/3.0),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: letters.map((String letter) {
//                    return Text(letter);
//                  }).toList(),
//                ),
//              ),
//          ),
//        ],
//      ),
        );
  }
}
