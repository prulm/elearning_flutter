import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const List<String> languages = <String>['English', 'Amharic'];

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue =
        context.locale == Locale("en", "US") ? languages.first : languages.last;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 206, 238),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PowerGeez',
          ),
        ).tr(),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Row(
          children: [
            Text(
              "Language",
              style: TextStyle(
                fontFamily: 'PowerGeez',
              ),
            ).tr(),
            SizedBox(
              width: 10,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: Color.fromARGB(255, 47, 206, 238)),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
                if (dropdownValue == "English" || dropdownValue == "እንግሊዝኛ") {
                  context.setLocale(Locale("en", "US"));
                } else if (dropdownValue == "Amharic" ||
                    dropdownValue == "አማርኛ") {
                  context.setLocale(Locale("am", "ET"));
                }
              },
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'PowerGeez',
                    ),
                  ).tr(),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
