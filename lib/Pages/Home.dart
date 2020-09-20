import 'package:MyList/Component/PassingData_form.dart';
import 'package:MyList/Component/Person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newPerson = Person("", 0);
    //PassingData Data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        // appBar: AppBar(
        //   title: Text("My List"),
        // ),
        body: ListView(
          children: [
            Text(
              "My List",
              style: Theme.of(context).textTheme.headline2,
            ),
            for (int i = 0; i < personList.length; i++)
              Card(
                child: ListTile(
                  title: Text("${i + 1} " + personList[i].name),
                  trailing: Text(
                    "${personList[i].score}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/showDtail_page",
                        arguments:
                            PassingData(i + 1, personList[i], personList));
                  },
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            personList.add(newPerson),
            Navigator.pushNamed(context, '/showEdit_page',
                arguments:
                    PassingData(personList.length, newPerson, personList))
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
