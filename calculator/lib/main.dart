import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String ornek = "";
  @override
  Widget build(BuildContext context) {
    double uzunluk = MediaQuery.of(context).size.height;
    double en = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ),
          Material(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topRight,
              height: uzunluk * 0.25,
              width: en,
              child: Text(
                ornek,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                IconButton(
                    onPressed: () {
                      if (ornek.length > 0)
                        ornek = ornek.substring(0, ornek.length - 1);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.backspace_sharp,
                      color: Colors.green,
                    )),
              ],
            ),
            height: uzunluk * 0.05,
          ),
          fonk1("C", "(", ")", "/"),
          fonk1("7", "8", "9", "x"),
          fonk1("4", "5", "6", "-"),
          fonk1("1", "2", "3", "+"),
          fonk1("+/-", "0", ",", "="),
        ],
      ),
    );
  }

  Row fonk1(String a, String b, String c, String d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buton(a, Colors.grey.shade300),
        buton(b, Colors.grey.shade300),
        buton(c, Colors.grey.shade300),
        buton(d, d == "=" ? Colors.green : Colors.grey.shade300),
      ],
    );
  }

  Widget buton(String a, Color color) {
    return InkWell(
      onTap: () {
        if (a == "C")
          ornek = "";
        else if (a == "x")
          ornek += "*";
        else if (a == "+/-")
          ornek = ornek;
        else if (a == "=") {
          try {
            ornek = Expression(ornek).eval().toString();
          } catch (e) {
            ornek = "Error";
          }
        } else
          ornek += a;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: color),
        width: 70,
        height: 70,
        child: Center(child: Text(a, style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
