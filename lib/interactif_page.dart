import 'package:flutter/material.dart';
import 'langage_favoris.dart';
import 'package:projet_interactif/simple_title.dart';
import 'package:projet_interactif/style_text.dart';
import 'divider_grey.dart';

class InteractifPage extends StatefulWidget {
  const InteractifPage({super.key});

  @override
  InteractifPageState createState() => InteractifPageState();
}

class InteractifPageState extends State<InteractifPage> {
  String prenom = "";
  String nom = "";
  String secret = "";
  String age = "";
  String genre = "Féminin";
  bool switchValue = true;
  double sliderValue = 50;
  bool check = false;
  int groupValue = 1;
  bool buttonPressed = false;

  Map<String, bool> hobbies = {
    "Jeux vidéos": false,
    "Cinéma": false,
    "Dessin": false,
    "Chant": false,
    "Randonnée": false,
  };

  List<String> myHobbies = [];

  @override
  void initState() {
    super.initState();
    // Tout ce que l'on va faire pendant l'initialisation du Widget
  }

  @override
  void dispose() {
    super.dispose();
    // Tout ce que l'on va faire quand le Widget sera dispose. Quand le Widget sera supprimé
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const StyleText(
          text: "Mon profil",
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                color: const Color.fromRGBO(188, 143, 143, 1),
                child: Column(
                  children: [
                    StyleText(
                      text: "Personne : $prenom $nom",
                    ),
                    StyleText(
                      text: "Age: $age ans",
                    ),
                    StyleText(
                      text: "Taille: ${sliderValue.toInt()} cm",
                    ),
                    StyleText(
                      text: "Genre: $genre",
                    ),
                    StyleText(
                      text: "Hobbies: $myHobbies",
                    ),
                    LanguageFavoris(),
                    ElevatedButton(
                        onPressed: () =>
                            setState(() => buttonPressed = !buttonPressed),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          elevation: 10,
                        ),
                        child: StyleText(
                            text: buttonPressed
                                ? "Cacher le secret"
                                : "Voir le secret")),
                    StyleText(
                      text: buttonPressed ? secret : "",
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8, height: 8),
              const DividerGrey(),
              const SizedBox(width: 8, height: 8),
              Column(
                children: [
                  const SimpleTitle(text: "Modifier les informations"),
                  const SizedBox(width: 15, height: 15),
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Entrez votre prénom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onChanged: (newString) {
                        setState(() {
                          prenom = newString;
                        });
                      }),
                  const SizedBox(width: 15, height: 15),
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Entrez votre nom",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onChanged: (newString) {
                        setState(() {
                          nom = newString;
                        });
                      }),
                  const SizedBox(width: 15, height: 15),
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Entrez votre age",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      keyboardType: TextInputType.number,
                      onChanged: (newString) {
                        setState(() {
                          age = newString;
                        });
                      }),
                  const SizedBox(width: 15, height: 15),
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Ecrivez un secret",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      obscureText: true,
                      onChanged: (newString) {
                        setState(() {
                          secret = newString;
                        });
                      }),
                  const SizedBox(width: 8, height: 8),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Genre : $genre"),
                  Switch(
                      value: switchValue,
                      onChanged: ((bool) {
                        setState(() {
                          switchValue = bool;
                          genre = (switchValue) ? "Féminin" : "Masculin";
                        });
                      }))
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Taille: ${sliderValue.toInt()}"),
                  Slider(
                    value: sliderValue,
                    min: 0,
                    max: 250,
                    onChanged: ((newValue) {
                      setState(() {
                        sliderValue = newValue;
                      });
                    }),
                    thumbColor: Colors.lightBlue,
                    activeColor: Colors.lightBlueAccent,
                  ),
                ],
              ),
              const SizedBox(width: 8, height: 8),
              const DividerGrey(),
              const SizedBox(width: 8, height: 8),
              Column(
                children: [
                  const SimpleTitle(text: "Mes hobbies"),
                  const SizedBox(width: 8, height: 8),
                  checks(),
                ],
              ),
              const SizedBox(width: 8, height: 8),
              const DividerGrey(),
              const SizedBox(width: 8, height: 8),
              Column(
                children: [
                  const SimpleTitle(text: "Langage préféré"),
                  LanguageFavoris(),
                  const SizedBox(width: 8, height: 8),
                  radios(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Widget r = Radio(
          activeColor: Colors.greenAccent,
          value: i,
          groupValue: groupValue,
          onChanged: ((newValue) {
            setState(() {
              groupValue = newValue as int;
            });
          }));
      radios.add(r);
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: radios,
    );
  }

  Column checks() {
    List<Widget> items = [];
    hobbies.forEach((hobbie, ajouter) {
      Widget row = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobbie),
          Checkbox(
            value: ajouter,
            onChanged: ((newValue) {
              setState(() {
                hobbies[hobbie] = newValue ?? false;
                if (newValue == true) {
                  myHobbies.add(hobbie);
                } else {
                  myHobbies.remove(hobbie);
                }
              });
            }),
            activeColor: Colors.pink,
          )
        ],
      );
      items.add(row);
    });
    return Column(
      children: items,
    );
  }
}
