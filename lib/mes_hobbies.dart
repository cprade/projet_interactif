import 'package:flutter/material.dart';
import 'all_profile.dart';
import 'Component/my_title.dart';

Map<String, bool> hobbies = {
  "Jeux vidéos": false,
  "Cinéma": false,
  "Dessin": false,
  "Chant": false,
  "Randonnée": false,
};

class MyHobbies extends StatefulWidget {
  const MyHobbies({Key? key}) : super(key: key);

  @override
  MyHobbiesState createState() => MyHobbiesState();
}

class MyHobbiesState extends State<MyHobbies> {
  AllProfile myProfile = AllProfile();
  Column build(BuildContext context) {
    return myHobbies();
  }

  Column myHobbies() {
    List<Widget> widgets = [myTitle("Mes hobbies")];
    hobbies.forEach((hobby, like) {
      Row r = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(hobby),
          Checkbox(
              activeColor: Colors.pink,
              value: like,
              onChanged: (newBool) {
                setState(() {
                  hobbies[hobby] = newBool ?? false;
                  List<String> str = [];
                  hobbies.forEach((key, value) {
                    if (value == true) {
                      str.add(key);
                    }
                  });
                  myProfile.hobbies = str;
                });
              })
        ],
      );
      widgets.add(r);
    });
    return Column(children: widgets);
  }
}
