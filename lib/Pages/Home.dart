import 'package:MyList/Component/Color_Code.dart';
import 'package:MyList/Component/PassingData_form.dart';
import 'package:MyList/Component/Person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String themeName;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePagestate();
  }
}

class _HomePagestate extends State<HomePage> {
  bool sortScore = false;
  bool colorTheme = false;

  Widget build(BuildContext context) {
    var newPerson = Person("", 0);

    int maxScore = personList[0].score;
    for (var k in personList) {
      if (k.score >= maxScore) {
        maxScore = k.score;
      }
    }

    (themeName == "Colorful Theme")
        ? themeName = "Colorful Theme"
        : themeName = "Monochromatic";

    return Scaffold(
        appBar: PreferredSize(
            child: Container(
              color: Color(colorCodeList[3]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              colorTheme = !colorTheme;
                              (colorTheme)
                                  ? colorCodeList = colorfulColors
                                  : colorCodeList = monochromaticColors;
                              //Decoration add Monochromatic/Colorful Theme
                              (colorTheme)
                                  ? themeName = "Colorful Theme"
                                  : themeName = "Monochromatic";
                            });
                          },
                          child: Container(
                            width: 160,
                            height: 25,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(colorCodeList[0]),
                                  Color(colorCodeList[5]),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 15,
                                )
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (themeName == "Monochromatic")
                                      ? Icon(
                                          Icons.colorize,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.color_lens,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                  Text(
                                    themeName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("My List",
                          style: Theme.of(context).textTheme.headline3),
                      trailing: GestureDetector(
                        //More Feature :  sort max/min score
                        onTap: () {
                          setState(() {
                            sortScore = !sortScore;
                            (sortScore)
                                ? personList
                                    .sort((a, b) => b.score.compareTo(a.score))
                                : personList
                                    .sort((a, b) => a.score.compareTo(b.score));
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(120)),
        body: ReorderableListView(
            //Challenge : Reorderable list of person
            children: <Widget>[
              for (final ps in personList)
                Card(
                  key: ValueKey(ps),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("${personList.indexOf(ps) + 1}"),
                      backgroundColor: Color(colorCodeList[
                          personList.indexOf(ps) % colorCodeList.length]),
                    ),
                    title: Row(
                      children: [
                        Text(ps.name + " "),
                        (ps.score == maxScore)
                            ? Icon(
                                Icons.star,
                                color: Color(colorCodeList[
                                    personList.indexOf(ps) %
                                        colorCodeList.length]),
                              )
                            : Text(""),
                      ],
                    ),
                    subtitle: Row(
                      //More Feature : mark star on the person with the highest score
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        (ps.score == maxScore)
                            ? Text("The Highest Score")
                            : Text("Click to see details"),
                      ],
                    ),
                    trailing: Text(
                      "${ps.score}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/showDtail_page",
                          arguments: PassingData(
                              personList.indexOf(ps) + 1, ps, personList));
                    },
                  ),
                ),
            ],
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                var personc = personList.removeAt(oldIndex);
                personList.insert(newIndex, personc);
              });
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            personList.add(newPerson),
            Navigator.pushNamed(context, '/showEdit_page',
                arguments:
                    PassingData(personList.length, newPerson, personList))
          },
          backgroundColor: Color(colorCodeList[4]),
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
