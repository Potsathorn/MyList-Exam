import 'package:MyList/Pages/Home.dart';
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
    // Person person1 = passedData.personWhoClicked;
    //showScore = "";

    //create widget

    Widget ButtonPad(String val) {
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
                (controller.text != "")
                    ? showName = controller.text
                    : showName = passedData.personWhoClicked.name;
                //showName = controller.text;
                passedData.personWhoClicked.name = showName;
                passedData.personWhoClicked.score = int.parse(showScore);
                Navigator.pushNamed(context, '/showHome_page',
                    arguments: PassingData(
                        passedData.id,passedData.personWhoClicked, passedData.allPerson));
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
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                        // onSubmitted: (String value) async {
                        //   await showDialog<void>(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //         title: const Text('Thanks!'),
                        //         content: Text('You typed "$value".'),
                        //         actions: <Widget>[
                        //           FlatButton(
                        //             onPressed: () {
                        //               passedData.personWhoClicked.name = value;
                        //               Navigator.pushNamed(context, '/showHome_page',
                        //           arguments: PassingData(
                        //               passedData.personWhoClicked, passedData.allPerson));
                        //             },
                        //             child: const Text('OK'),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // },
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 2),
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
                
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPad("7"),
                        ButtonPad("8"),
                        ButtonPad("9"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPad("4"),
                        ButtonPad("5"),
                        ButtonPad("6"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPad("1"),
                        ButtonPad("2"),
                        ButtonPad("3"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonPad("CLR"),
                        ButtonPad("0"),
                        ButtonPad("OK"),
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
