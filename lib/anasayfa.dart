import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String alinanVeri = "";
  bool checkBoxState = false;
  bool switchState = false;
  int radioState = 0;
  bool progressControl = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkeler = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkeler.add("Türkiye");
    ulkeler.add("Japonya");
    ulkeler.add("Almanya");
    ulkeler.add("Romanya");
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets"),),
      body: SingleChildScrollView(
        child: Center(
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
              Row(
                children: [
                  SizedBox(
                    width: 190,
                    child: SwitchListTile(
                      title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchState ,
                        onChanged: (veri){
                          setState(() {
                            switchState = veri;
                      });
                    }),
                  ),
                  SizedBox(
                    width: 190,
                    child: CheckboxListTile(
                        title: const Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: checkBoxState ,
                        onChanged: (veri){
                          setState(() {
                            checkBoxState = veri!;
                          });
                        }),
                  ),

                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 190,
                    child: RadioListTile(
                        title: const Text("Barcelona"),
                        value: 1 ,
                        groupValue: radioState,
                        onChanged: (veri){
                          setState(() {
                            radioState = veri!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 190,
                    child: RadioListTile(
                        title: const Text("Real Madrid"),
                        value: 2 ,
                        groupValue: radioState,
                        onChanged: (veri){
                          setState(() {
                            radioState = veri!;
                          });
                        }),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    progressControl = true;
                    });
                  }, child: const Text("Başla"),
                  ),
                 Visibility(
                     visible: progressControl,
                     child:  const CircularProgressIndicator()
                 ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressControl = false;
                    });
                  }, child: const Text("Dur"),
                  ),
                ],
              ),
              Text(ilerleme.toString()),
              Slider(
                  max: 100,
                  min: 0.0,
                  value: ilerleme,
                  onChanged: (veri){
                    setState(() {
                      ilerleme = veri!;
                    });
                  }
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                      child: TextField(controller: tfSaat, decoration:  const InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: (){
                     showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                     .then((value) {
                       tfSaat.text = "${value!.hour} : ${value.minute}";
                     });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(
                      width: 120,
                      child: TextField(controller: tfTarih, decoration:  const InputDecoration(hintText: "Tarih"),),
                  ),
                  IconButton(onPressed: (){
                    showDatePicker(context: context,
                            initialDate: DateTime.now() , 
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(2030))
                            .then((value) {
                              tfTarih.text = "${value!.day}/${value.month}/${value.year}";
                              });
                  }, icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
              DropdownButton(
                  value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkeler.map((ulke){
                    return DropdownMenuItem(value: ulke, child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                   setState(() {
                     secilenUlke = veri!;
                   });
                  }),
              GestureDetector(
                onTap: (){
                  print("Container tek tıklandı");
                },
                onDoubleTap: (){
                  print("çift tıklandı");
                },
                onLongPress: (){
                  print("Container üzerine uzun basıldı");
                },
                child: Container(
                  width: 200,
                    height: 100,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(onPressed: (){
                print("Switch durum: ${switchState}");
                print("Checkbox durum: ${checkBoxState}" );
                print("Radio durum: ${radioState}" );
                print("Progres durum: ${ilerleme}" );
                print("Ülke durum: ${secilenUlke}" );

              }, child: const Text("Göster"))
            ],
          ),
        ),
      ),
    );
  }
}
