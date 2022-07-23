import 'package:diet_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class KitleEndeksi extends StatefulWidget {
  _KitleEndeksiState createState() => _KitleEndeksiState();
}

class _KitleEndeksiState extends State<KitleEndeksi> {
  final ControllerBoy = TextEditingController();
  final ControllerKilo = TextEditingController();
  String data = "";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E8E4),
      appBar: AppBar(
        title: const Text(
          "VÜCUT KİTLE ENDEKSİ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF272A3F),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: 200,
              child: Image.asset("images/scale.png"),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: ControllerBoy,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF272A3F), width: 2)),
                  hintText: "Boyunuzu giriniz. Örneğin 1.75 ",
                  labelText: "Boy",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF272A3F),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF272A3F),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: ControllerKilo,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF272A3F), width: 2)),
                  hintText: "Kilonuzu giriniz. Örneğin 65 ",
                  labelText: "Kilo",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF272A3F),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF272A3F),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              " $data",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w800),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF272A3F),
              ),
              child: const Text(
                "Hesapla",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    if (ControllerBoy.text.isNotEmpty &&
                        ControllerKilo.text.isNotEmpty) {
                      double valueBoy = double.parse(ControllerBoy.text);
                      double valueKilo = double.parse(ControllerKilo.text);
                      double indeks = valueKilo / (valueBoy * valueBoy);

                      if (indeks < 18) {
                        data =
                            "Zayıf \n\n Vücut Kitle Endeksi : ${indeks.toStringAsFixed(5)} ";
                      } else if (indeks >= 18 && indeks < 25) {
                        data =
                            "Normal \n\n  Vücut Kitle Endeksi : ${indeks.toStringAsFixed(5)}";
                      } else if (indeks >= 25 && indeks < 30) {
                        data =
                            "Kilolu \n\n Vücut Kitle Endeksi : ${indeks.toStringAsFixed(5)}";
                      } else if (indeks >= 30 && indeks < 35) {
                      } else {
                        data =
                            "Ciddi Obez \n\n Vücut Kitle Endeksi  : ${indeks.toStringAsFixed(5)}";
                      }
                    } else {
                      data = "Boy veya kilo boş olamaz ! ";
                    }
                    ;
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
