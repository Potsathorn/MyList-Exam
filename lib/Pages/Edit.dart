import 'package:MyList/Component/PassingData_form.dart';
//import 'package:MyList/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditPageState();
  }
}

class _EditPageState extends State<StatefulWidget> {
  var controller = TextEditingController();

  String showScore;
  String showName;
  @override
  Widget build(BuildContext context) {
    PassingData passedData = ModalRoute.of(context).settings.arguments;

    void showError() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Name is empty'),
              content: Text('Please enter your name.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }

    void showConfirm(String nameChanged, int scoreChanged) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm!'),
              content: Text(
                  'Name : ' + nameChanged + '    Score : ' + '$scoreChanged'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/showHome_page');
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }

    Widget buttonPad(String val) {
      return GestureDetector(
          onTap: () {
            (showScore != null)
                ? showScore = showScore
                : showScore = "${passedData.personWhoClicked.score}";

            (showName != null)
                ? showName = showName
                : showName = passedData.personWhoClicked.name;

            setState(() {
              if (val != "CLR" && val != "OK")
                showScore += val;
              else if (val == "CLR")
                showScore = "";
              else {
                print(showScore);
                if (showName != "") {
                  (controller.text.isNotEmpty)
                      ? showName = controller.text
                      : showName = passedData.personWhoClicked.name;
                  passedData.personWhoClicked.name = showName;
                  (showScore != "") ? showScore = showScore : showScore = "0";
                  passedData.personWhoClicked.score = int.parse(showScore);
                  showConfirm(showName, int.parse(showScore));
                } else {
                  if (controller.text.isNotEmpty) {
                    showName = controller.text;
                    passedData.personWhoClicked.name = showName;
                    (showScore != "") ? showScore = showScore : showScore = "0";
                    passedData.personWhoClicked.score = int.parse(showScore);
                    showConfirm(showName, int.parse(showScore));
                  } else {
                    showError();
                  }
                }
              }
            });
          },
          child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              width: 80,
              height: 60,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Center(
                child: Text(
                  val,
                  style: Theme.of(context).textTheme.headline5,
                ),
              )));
    }

    // final PassingData passedData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
        //scrollDirection: Axis.vertical,

        children: [
          Column(
            //mainAxisSize: MainAxisSize.max,

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name : ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Container(
                      width: 190,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: (showName != null)
                              ? showName = showName
                              : showName = passedData.personWhoClicked.name,
                          hintStyle: Theme.of(context).textTheme.headline5,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 2),
                child: Container(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: 70.0,
                    child: Center(
                        child: (showScore != null)
                            ? Text(
                                showScore,
                                style: Theme.of(context).textTheme.headline2,
                              )
                            : Text(
                                "${passedData.personWhoClicked.score}",
                                style: Theme.of(context).textTheme.headline2,
                              )
                        // Text(
                        //   showScore,
                        //   style: Theme.of(context).textTheme.headline2,
                        // ),
                        ),
                  ),
                  //Text("${passedData.personWhoClicked.score}"),
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonPad("7"),
                        buttonPad("8"),
                        buttonPad("9"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonPad("4"),
                        buttonPad("5"),
                        buttonPad("6"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonPad("1"),
                        buttonPad("2"),
                        buttonPad("3"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonPad("CLR"),
                        buttonPad("0"),
                        buttonPad("OK"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
