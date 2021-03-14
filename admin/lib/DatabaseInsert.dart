import 'package:flutter/material.dart';
import 'CloudFirestore.dart';
import 'GoogleApi.dart';

class DatabaseInsert extends StatefulWidget {
  const DatabaseInsert({Key key}) : super(key: key);

  @override
  _DatabaseInsertState createState() => _DatabaseInsertState();
}

class _DatabaseInsertState extends State<DatabaseInsert> {
  TextStyle style = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
  BoxDecoration decoration =
      BoxDecoration(border: Border.all(color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data"),
      ),
      body: FutureBuilder(
          future: reading(),
          builder:
              (BuildContext context, AsyncSnapshot<List<List<String>>> snap) {
            if (snap.hasData) {
              List list = snap.data;

              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              list.length.toString() + " elements finded",
                              style: TextStyle(fontSize: 40),
                            ),
                          )),
                      Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                            decoration: decoration,
                                            child: Text(list[index][1],
                                                style: style))),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                            decoration: decoration,
                                            child: Text(list[index][3],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: Text(list[index][4],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: Text(list[index][6],
                                                style: style))),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          if (list.length != 0) await addLeads(list);
                        }),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
