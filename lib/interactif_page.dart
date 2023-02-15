import 'package:flutter/material.dart';
import 'package:projet_interactif/all_profile.dart';
import 'package:projet_interactif/taille.dart';
import 'Component/divider_grey.dart';
import 'package:projet_interactif/genre.dart';
import 'Component/my_fieldtext.dart';
import 'Component/my_title.dart';
import 'mes_hobbies.dart';

class InteractifPage extends StatefulWidget {
  const InteractifPage({super.key});

  @override
  InteractifPageState createState() => InteractifPageState();
}

class InteractifPageState extends State<InteractifPage> {
  AllProfile myProfile = AllProfile(surname: "Christine", name: "Prade");
  late TextEditingController surname;
  late TextEditingController name;
  late TextEditingController secret;
  late TextEditingController age;
  bool showSecret = false;

  Map<String, bool> hobbies = {
    "Jeux vidéos": false,
    "Cinéma": false,
    "Dessin": false,
    "Chant": false,
    "Randonnée": false,
  };

  @override
  void initState() {
    super.initState();
    surname = TextEditingController();
    name = TextEditingController();
    secret = TextEditingController();
    age = TextEditingController();
    surname.text = myProfile.surname;
    name.text = myProfile.name;
    secret.text = myProfile.secret;
    age.text = myProfile.age.toString();
  }

  @override
  void dispose() {
    surname.dispose();
    name.dispose();
    secret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon profil"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                width: size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                color: const Color.fromRGBO(188, 143, 143, 1),
                child: Column(
                  children: [
                    Text(myProfile.setName()),
                    Text("Age: ${myProfile.setAge()}"),
                    Text("Taille: ${myProfile.setHeight()}"),
                    Text("Genre: ${myProfile.genderString()}"),
                    Text("Hobbies: ${myProfile.setHobbies()}"),
                    Text(
                        "Langage de programmation favori: ${myProfile.favoriteLang} "),
                    ElevatedButton(
                        onPressed: updateSecret,
                        child: Text(
                            (showSecret) ? "Cacher secret" : "Montrer secret")),
                    (showSecret)
                        ? Text(myProfile.secret)
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                  ],
                ),
              ),
              const DividerGrey(),
              myTitle("Modifier les infos"),
              const SizedBox(width: 15, height: 15),
              myTextField(controller: surname, hint: "Entrez votre prénom"),
              const SizedBox(width: 15, height: 15),
              myTextField(controller: name, hint: "Entrez votre nom"),
              const SizedBox(width: 15, height: 15),
              myTextField(
                  controller: secret,
                  hint: "Dites nous un secret",
                  isSecret: true),
              const SizedBox(width: 15, height: 15),
              myTextField(
                  controller: age,
                  hint: "Entrez votre age",
                  type: TextInputType.number),
              const SizedBox(width: 15, height: 15),
              const Genre(),
              const Taille(),
              const DividerGrey(),
              const MyHobbies(),
              const DividerGrey(),
              myRadios()
            ],
          ),
        ),
      ),
    );
  }

  updateSecret() {
    setState(() {
      showSecret = !showSecret;
    });
  }

  Column myRadios() {
    List<Widget> w = [];
    List<String> langs = ["Dart", "Php", "Javascript", "Java", "Python"];
    int index =
        langs.indexWhere((lang) => lang.startsWith(myProfile.favoriteLang));
    for (var x = 0; x < langs.length; x++) {
      Column c = Column(
        children: [
          Text(langs[x]),
          Radio(
              activeColor: Colors.lightGreen,
              value: x,
              groupValue: index,
              onChanged: (newValue) {
                setState(() {
                  myProfile.favoriteLang = langs[newValue as int];
                });
              })
        ],
      );
      w.add(c);
    }
    return Column(
      children: [
        myTitle("Langage préféré"),
        const SizedBox(width: 15, height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: w)
      ],
    );
  }

  updateUser() {
    setState(() {
      myProfile = AllProfile(
          surname: (surname.text != myProfile.surname)
              ? surname.text
              : myProfile.surname,
          name: name.text,
          secret: secret.text,
          favoriteLang: myProfile.favoriteLang,
          hobbies: myProfile.hobbies,
          height: myProfile.height,
          age: int.parse(age.text),
          gender: myProfile.gender);
    });
  }
}
