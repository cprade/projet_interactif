import 'package:flutter/material.dart';
import 'package:projet_interactif/all_profile.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  GenreState createState() => GenreState();
}

class GenreState extends State<Genre> {
  AllProfile myProfile = AllProfile(surname: "Christine", name: "Prade");
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Genre: ${myProfile.genderString()}"),
        Switch(
            value: myProfile.gender,
            onChanged: ((newBool) {
              setState(() {
                myProfile.gender = newBool;
              });
            })),
      ],
    );
  }
}
