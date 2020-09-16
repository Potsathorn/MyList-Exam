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
  @override
  Widget build(BuildContext context) {
    PassingData passedData = ModalRoute.of(context).settings.arguments;
    // final PassingData passedData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name : ",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                passedData.personWhoClicked.name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          Container(
            child: SizedBox(
              width: 500.0,
              //height: 70.0,
              child: Center(
                child: Text(
                  "${passedData.personWhoClicked.score}",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            //Text("${passedData.personWhoClicked.score}"),
            color: Colors.blue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "1",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "2",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "3",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "4",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "5",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "6",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "7",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "8",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "9",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "CLR",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "0",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "OK",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
