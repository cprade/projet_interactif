import 'package:flutter/material.dart';
import 'package:projet_interactif/style_text.dart';
import 'interactif_page.dart';

enum Language { javascript, php, dart, python, java }

class LanguageFavoris extends State<InteractifPage> {
  Language? _language = Language.javascript;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const StyleText(
          text: "Langages de programmation préféré: ",
        ),
        RadioListTile<Language>(
          activeColor: Colors.lightGreen,
          title: const Text('Javascript'),
          value: Language.javascript,
          groupValue: _language,
          onChanged: (Language? value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          activeColor: Colors.lightGreen,
          title: const Text('PhP'),
          value: Language.php,
          groupValue: _language,
          onChanged: (Language? value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          activeColor: Colors.lightGreen,
          title: const Text('Dart'),
          value: Language.dart,
          groupValue: _language,
          onChanged: (Language? value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          activeColor: Colors.lightGreen,
          title: const Text('Python'),
          value: Language.python,
          groupValue: _language,
          onChanged: (Language? value) {
            setState(() {
              _language = value;
            });
          },
        ),
        RadioListTile<Language>(
          activeColor: Colors.lightGreen,
          title: const Text('Java'),
          value: Language.java,
          groupValue: _language,
          onChanged: (Language? value) {
            setState(() {
              _language = value;
            });
          },
        ),
      ],
    );
  }
}
