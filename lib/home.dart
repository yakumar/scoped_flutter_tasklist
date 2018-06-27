import 'package:flutter/material.dart';
import 'package:newtut/taskList.dart';
import 'package:scoped_model/scoped_model.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _taskController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TaskList>(
        model: new TaskList(),
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
            title: new Text('Simple Tasks'),
            backgroundColor: Colors.lime,
          ),
          body: new ListView(
            children: <Widget>[
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new TextField(
                        controller: _taskController,
                        decoration: new InputDecoration(fillColor: Colors.lime),
                      ),
                    ),
                    new ScopedModelDescendant<TaskList>(
                        builder: (context, child, model) {
                      return new RaisedButton(
                        onPressed: () {
                          _addTasks(model);
                        },
                        child: new Text('Add'),
                      );
                    }),
                  ],
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 8.0)),
              new ScopedModelDescendant<TaskList>(
                builder: (context, child, model) {
                  return new ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.taskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
                          elevation: 8.0,
                          color: Colors.lime,
                          child: new ListTile(
                            title: new Text(model.taskList[index]),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ));
  }

  void _addTasks(TaskList newMod) {
    //setState(() {


    newMod.addTo(_taskController.text);

    print(_taskController.text);
    print('${newMod.taskList}');

    _taskController.clear();

    //});
  }
}
