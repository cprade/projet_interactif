import 'package:flutter/material.dart';
import 'package:projet_interactif/all_profile.dart';

class Taille extends StatefulWidget {
  const Taille({super.key});

  @override
  TailleState createState() => TailleState();
}

class TailleState extends State<Taille> {
  AllProfile myProfile = AllProfile(surname: "Christine", name: "Prade");
  double sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Taille: ${myProfile.setHeight()}"),
        Slider(
            value: myProfile.height,
            min: 0,
            max: 250,
            onChanged: ((newHeight) {
              setState(() {
                myProfile.height = newHeight;
              });
            }))
      ],
    );
  }
}
