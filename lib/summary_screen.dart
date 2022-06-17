import 'package:flutter/material.dart';
import 'package:project1/base_card.dart';
import 'data_entry_screen.dart';
import 'constants.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({required this.cal_in, required this.cal_out, required this.summary});

  final int cal_in;
  final int cal_out;
  final List<String> summary;

  Color get_color(String level) {
    if (level == "Balanced"){
      return kBalance;
    }
    return kNotBalance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your daily calories summary:',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: BaseCard(
                    theColor: get_color(summary[0]),
                    theChild: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                        Text(
                          summary[0],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ),
                    ),
                ),
              BaseCard(
                theChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    summary[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                theColor: Colors.orangeAccent.shade100,
              ),
              SizedBox(height: 50),
              BaseCard(
                theColor: kCardColor,
                theChild: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Detail:\n Total calories intake: $cal_in \n Total calories burned: $cal_out',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),


              ),
              TextButton(
                  child: const Text('NEW'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    textStyle:
                      const TextStyle(fontSize: 40.0),

                  ),


                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DataEntryScreen();
                        },
                      ),
                    );
                  }),
            ],
          )),
    );
  }

}