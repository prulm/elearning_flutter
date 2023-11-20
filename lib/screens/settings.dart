import 'package:easy_localization/easy_localization.dart';
import 'package:elearning_flutter/screens/profile.dart';
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
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {}),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Profile Settings",
              style: TextStyle(
                fontFamily: 'PowerGeez',
              ),
            ).tr(),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: Text(
                "Language",
                style: TextStyle(
                  fontFamily: 'PowerGeez',
                ),
              ).tr(),
              trailing: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 47, 206, 238)),
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
              )),
        ],
      ),
    );
  }
}
