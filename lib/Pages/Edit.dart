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
            children: [
              ButtonBar(
                children: [Text("1")],
              ),
              ButtonBar(
                children: [Text("2")],
              ),
              ButtonBar(
                children: [Text("3")],
              ),
            ],
          ),
          Row(
            children: [
              ButtonBar(
                children: [Text("4")],
              ),
              ButtonBar(
                children: [Text("5")],
              ),
              ButtonBar(
                children: [Text("6")],
              ),
            ],
          ),
          Row(
            children: [
              ButtonBar(
                children: [Text("7")],
              ),
              ButtonBar(
                children: [Text("8")],
              ),
              ButtonBar(
                children: [Text("9")],
              ),
            ],
          ),
          Row(
            children: [
              ButtonBar(
                children: [Text("CLR")],
              ),
              ButtonBar(
                children: [Text("0")],
              ),
              ButtonBar(
                children: [Text("OK")],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
