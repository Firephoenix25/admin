import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'DatabasePage.dart';

class ViewDatabases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("ClosedCall")),
              Tab(icon: Text("NotAnswered")),
              Tab(icon: Text("ToRecall")),
              Tab(icon: Text("RecallMeeting")),
              Tab(icon: Text("Meeting")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DatabasePage(page: "ClosedCall"),
            DatabasePage(page: "NotAnswered"),
            DatabasePage(page: "ToRecall"),
            DatabasePage(page: "RecallMeeting"),
            DatabasePage(page: "Meeting"),
          ],
        ),
      ),
    );
  }
}

/*FutureBuilder(
          future: readToRecall(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List<Map> list = snap.data;

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("nome", style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("Data e Ora", style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("Segretaria", style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("email propietario",
                                        style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("numero propietario",
                                        style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("numero", style: style))),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("note", style: style))),
                          ],
                        ),
                      ),
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
                                        flex: 2,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['name'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                DateTime.parse(list[index]
                                                                ['date']
                                                            .toDate()
                                                            .toString())
                                                        .day
                                                        .toString() +
                                                    " ora:" +
                                                    DateTime.parse(list[index]
                                                                ['date']
                                                            .toDate()
                                                            .toString())
                                                        .hour
                                                        .toString() +
                                                    ":" +
                                                    DateTime.parse(list[index]
                                                                ['date']
                                                            .toDate()
                                                            .toString())
                                                        .minute
                                                        .toString(),
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['secretary'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['owner email'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['owner number'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['number'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['email'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['notes'],
                                                style: style))),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
/*                   Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          if (list.length != 0) await addLeads(list);
                        }),
                  ), */
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),*/
