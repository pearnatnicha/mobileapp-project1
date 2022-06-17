import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/base_card.dart';
import 'summary_screen.dart';
import 'enums.dart';
import 'constants.dart';

class CaloriesTrackScreen extends StatefulWidget {
  const CaloriesTrackScreen({required this.weight, required this.height, required this.age ,required this.gender});

  final int weight;
  final int height;
  final int age;
  final Gender gender;

  @override
  State<CaloriesTrackScreen> createState() => _CaloriesTrackScreenState();
}

class _CaloriesTrackScreenState extends State<CaloriesTrackScreen> {
  int cal_in = 0;
  int cal_out = 0;
  int total_out = 0;
  int step = 0;

  TextEditingController inputControler_consume = new TextEditingController();
  TextEditingController inputControler_burn = new TextEditingController();
  TextEditingController inputControler_step = new TextEditingController();

  String _textConsume = "";
  String _textBurn = "";
  String _textStep = "";
  List<String> _textSummary = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calories Tracker"),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: inputControler_consume,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "Enter intake calories",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.black12,
                      filled: true,
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  Text(
                    '$_textConsume',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton( //add calories intake
                        onPressed: () {
                          setState(() {
                            cal_in += int.parse(inputControler_consume.text);
                            _textConsume = "Total consumed calories: " +
                                "$cal_in" +
                                " kcal";
                            // _text = inputControler.text;
                          });
                          inputControler_consume.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton( //reset calories intake
                        onPressed: () {
                          setState(() {
                            cal_in = 0;
                            _textConsume = "Total consumed calories: 0 kcal";
                            // _text = inputControler.text;
                          });
                          inputControler_consume.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Reset",
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
            SizedBox(height: 15),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: inputControler_burn,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "Enter burned calories",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.black12,
                      filled: true,
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  Text(
                    '$_textBurn',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton( // add burned calories
                        onPressed: () {
                          setState(() {
                            cal_out += int.parse(inputControler_burn.text);
                            _textBurn = "Total burned calories: " +
                                "$cal_out" +
                                " kcal";
                            // _text = inputControler.text;
                          });
                          inputControler_burn.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton( //reset calories burned
                        onPressed: () {
                          setState(() {
                            cal_out = 0;
                            _textBurn = "Total burned calories: 0 kcal";
                            // _text = inputControler.text;
                          });
                          inputControler_burn.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: inputControler_step,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "Enter steps",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.black12,
                      filled: true,
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  Text(
                    '$_textStep',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton( //add steps took
                        onPressed: () {
                          setState(() {
                            step += int.parse(inputControler_step.text);
                            _textStep = "Total Step: " +
                                "$step" +
                                " Steps";
                            // _text = inputControler.text;
                          });
                          inputControler_step.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton( // reset steps took
                        onPressed: () {
                          setState(() {
                            step = 0;
                            _textStep = "Total Step: 0 Steps";
                            // _text = inputControler.text;
                          });
                          inputControler_step.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kCardColor, // Background color
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (widget.gender == Gender.male) { //calculate balance from bmr and calories in&out
                              total_out = (step * 0.4).round() + cal_out +
                                  88 +
                                  (13 * widget.weight) +
                                  (5 * widget.height) -
                                  (6 * widget.age);
                            } else if (widget.gender == Gender.female) {
                              total_out = (step * 0.4).round() + cal_out +
                                  448 +
                                  (9 * widget.weight) +
                                  (3 * widget.height) -
                                  (4 * widget.age);
                            }
                            if (total_out >= cal_in) { // then set the balance information
                              _textSummary.add("Balanced");
                              _textSummary.add(
                                  "You are on the right track. Keep going with this routine to stay healthy");
                            } else if (total_out < cal_in) {
                              _textSummary.add("Not Balanced");
                              _textSummary.add(
                                  "You might want to take some exercise to make it balance and stay healthy");
                            }
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SummaryScreen( //navigate to summary screen
                                    cal_in: cal_in,
                                    cal_out: total_out,
                                    summary: _textSummary);
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Check Balance",
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
