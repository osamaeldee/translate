import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translator1/Add.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final inputController = TextEditingController();
  final outputController = TextEditingController();
  final translator = GoogleTranslator();
  String inputLanguage = "English";
  String outputLanguage = "French";
  String inputText = "";
  String translatedText = "";

  Future<void> translateText() async {
    if (inputText.isNotEmpty) {
      try {
        final translated = await translator.translate(
          inputText,
          from: inputLanguageCode(inputLanguage),
          to: inputLanguageCode(outputLanguage),
        );
        setState(() {
          translatedText = translated.text;
          outputController.text = translatedText;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error translating text: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter some text to translate.'),
        ),
      );
    }
  }

  String inputLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      case 'Urdu':
        return 'ur';
      case 'Hindi':
        return 'hi';
      case 'Arabic':
        return 'ar';
      case 'Amharic':
        return 'am';
      case 'Swahili':
        return 'sw';
      case 'Hausa':
        return 'ha';
      case 'Yoruba':
        return 'yo';
      case 'Igbo':
        return 'ig';
      case 'Somali':
        return 'so';
      case 'Shona':
        return 'sn';
      case 'Kinyarwanda':
        return 'rw';
      case 'Malagasy':
        return 'mg';
      case 'Zulu':
        return 'zu';
      case 'Xhosa':
        return 'xh';
      case 'Setswana':
        return 'tn';
      case 'Sesotho':
        return 'st';
      default:
        return 'en';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Translator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "image/translate1.png",
                fit: BoxFit.contain,
                height: 200,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: inputLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            inputLanguage = newValue!;
                          });
                        },
                        items: languageDropdownItems(),
                        decoration: const InputDecoration(
                          labelText: 'Source Language',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: outputLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            outputLanguage = newValue!;
                          });
                        },
                        items: languageDropdownItems(),
                        decoration: const InputDecoration(
                          labelText: 'Target Language',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: translateText,
                icon: const Icon(Icons.translate),
                label: const Text("Translate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: inputController,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          labelText: 'Input Text',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            inputText = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: outputController,
                        maxLines: 10,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Translated Text',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BannerAdWidget(),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> languageDropdownItems() {
    return <String>[
      "English",
      "French",
      "Spanish",
      "German",
      "Urdu",
      "Hindi",
      "Arabic",
      "Amharic",
      "Swahili",
      "Hausa",
      "Yoruba",
      "Igbo",
      "Somali",
      "Shona",
      "Kinyarwanda",
      "Malagasy",
      "Zulu",
      "Xhosa",
      "Setswana",
      "Sesotho",
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
