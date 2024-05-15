import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import 'model/langauge_data.dart';
import 'model/string_caption.dart';
import 'translation_tutorial.dart';
import 'utility.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringCaption.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TranslationTutorial(),
                ),
              );
            },
            icon: const Icon(Icons.translate),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(StringCaption.welcome),
            Text(StringCaption.welcomeText),
            _createLanguageDropDown()
          ],
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(StringCaption.drpText),
      onChanged: (LanguageData? language) {
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  // call from dropdown for change locale
  void changeLanguage(BuildContext context, String selectedLanguageCode) async {
    if (selectedLanguageCode == 'gu') {
      Utility.targetLanguage = TranslateLanguage.gujarati;
      await StringCaption.initialize();
    }
    if (selectedLanguageCode == 'hi') {
      Utility.targetLanguage = TranslateLanguage.hindi;
      await StringCaption.initialize();
    }
    if (selectedLanguageCode == 'en') {
      Utility.targetLanguage = TranslateLanguage.english;
      await StringCaption.initialize();
    }

    setState(() {});
  }
}
