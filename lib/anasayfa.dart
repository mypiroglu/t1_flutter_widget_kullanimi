import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String alinanVeri = "";
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),),
      body: Center(
        child: Column(
          children: [
             Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController,
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                alinanVeri = tfController.text;
              });
            }, child: const Text("Veri Al")
            ),
          ],
        ),
      ),
    );
  }
}
