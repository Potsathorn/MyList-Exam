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
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Name : "),
              Text("____________"),
            ],
          ),
          Container(
            child: Text("80"),
            color: Colors.blue,

          ),
          Row(children: [
            ButtonBar(children: [Text("1")],),
            ButtonBar(children: [Text("2")],),
            ButtonBar(children: [Text("3")],),
          ],),
          Row(children: [
            ButtonBar(children: [Text("4")],),
            ButtonBar(children: [Text("5")],),
            ButtonBar(children: [Text("6")],),
          ],),
          Row(children: [
            ButtonBar(children: [Text("7")],),
            ButtonBar(children: [Text("8")],),
            ButtonBar(children: [Text("9")],),
          ],),
          Row(children: [
            ButtonBar(children: [Text("CLR")],),
            ButtonBar(children: [Text("0")],),
            ButtonBar(children: [Text("OK")],),
          ],),
        ],
      ),
    );
  }
}
