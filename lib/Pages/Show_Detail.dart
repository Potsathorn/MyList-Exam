import 'package:MyList/Pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShowDetailState();
  }
}

class _ShowDetailState extends State<ShowDetail> {
  @override
  Widget build(BuildContext context) {
    var person = Person(null, null);
    person = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Show Detail"),
      // ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,30, 10, 30),
              child: ListTile(
                title: Text(person.name),
                trailing: Text(
                  "${person.score}",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,400, 10, 30),
            child: Center(
                child: Text(
              "Next Person >>",
              style: Theme.of(context).textTheme.headline3,
            )),
          )
        ],
      ),
      // appBar: AppBar(
      //   title: Text("1 "+person1.name),
      // ),
    );
  }
}
