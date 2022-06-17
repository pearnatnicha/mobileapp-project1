import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/base_card.dart';
import 'package:project1/calories_track_screeen.dart';
import 'calories_track_screeen.dart';
import 'constants.dart';

enum Gender { male, female }

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  //Instance variable
  int weight = 0;
  int height = 0;
  int age = 0;
  TextEditingController inputControler_weight = new TextEditingController();
  TextEditingController inputControler_height = new TextEditingController();
  TextEditingController inputControler_age = new TextEditingController();

  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details"),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: inputControler_weight,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: "Weight (kg)",
                          border: OutlineInputBorder(),
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: inputControler_height,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: "Height (cm)",
                          border: OutlineInputBorder(),
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: inputControler_age,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: "Age",
                          // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          border: OutlineInputBorder(),
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            weight = int.parse(inputControler_weight.text);
                            height = int.parse(inputControler_height.text);
                            age = int.parse(inputControler_age.text);
                            // inputControler_age.text.isEmpty ? _validate = true : _validate = false;
                          });
                          // inputControler_consume.clear();
                        },
                        child: Text( // save weight, height, and age data
                          "Save",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            weight = 0;
                            height = 0;
                            age = 0;
                          });
                          inputControler_weight.clear();
                          inputControler_height.clear();
                          inputControler_age.clear();
                        },
                        child: Text(
                          "Reset", // reset weight, height, and age data
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            BaseCard(
              theColor: kCardColor,
              theChild: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    'Choose your gender:', // choice for user to choose their gender (male/female)
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: kLetterColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: const Text(
                      'Male',
                      style: TextStyle(
                        color: kLetterColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio<Gender>(
                      value: Gender.male,
                      groupValue: gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          gender = Gender.male;
                          print(gender.toString());
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Female',
                      style: TextStyle(
                        color: kLetterColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio<Gender>(
                      value: Gender.female,
                      groupValue: gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          gender = Gender.female;
                          print(gender.toString());
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CaloriesTrackScreen( //navigate to calories tracker screen
                                weight: weight,
                                height: height,
                                age: age,
                                gender: gender);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.red.shade900),
                  ),
                  SizedBox(height: 50),
                ])),
          ],
        ),
      ),
    );
  }
}
