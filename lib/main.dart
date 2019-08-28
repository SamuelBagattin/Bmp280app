import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/moduleResponse.dart';

import 'api.dart';

void main() {
  runApp(MyApp());
}

//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Modules';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<ModuleResponse>(
        future: fetchModules(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ModuleList(moduleResponse: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ModuleList extends StatelessWidget {
  final ModuleResponse moduleResponse;

  ModuleList({Key key, this.moduleResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height/1.2)
      ),
      itemCount: moduleResponse.result.length,

      itemBuilder: (context, index) {
        var currentModule = moduleResponse.result[index];
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.adjust),
                title: Text(currentModule.name, style: TextStyle(color: Colors.blue),),
              ),
              ListTile(title: Text("Datetime") , subtitle: Text(currentModule.lastData != null ? currentModule.lastData.dateTime.toIso8601String() : "Pas de données")),
              ListTile(title: Text("Temperature") , subtitle: Text(currentModule.lastData != null ? currentModule.lastData.temperature.toString() : "Pas de données")),
              ListTile(title: Text("Pression") , subtitle: Text(currentModule.lastData != null ? currentModule.lastData.pression.toString() : "Pas de données")),
              ButtonTheme.bar(
                // make buttons use the appropriate styles for cardsR
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Details'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
