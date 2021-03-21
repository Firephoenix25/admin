import 'package:flutter/material.dart';
import '../CloudFirestore.dart';
import '../GoogleApi.dart';
import 'package:get/get.dart';
import '../AllLeadsController.dart';

class AllLeads extends StatelessWidget {
  final TextStyle style = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
  final BoxDecoration decoration =
      BoxDecoration(border: Border.all(color: Colors.black));
  final BoxDecoration decorationHead = BoxDecoration(
      color: Colors.blue, border: Border.all(color: Colors.black));

  final Future future = allLeads();
  @override
  Widget build(BuildContext context) {
    AllLeadsController controller = Get.put(AllLeadsController());
    controller.setI(1);

    return Scaffold(
      body: FutureBuilder(
          future: future,
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
                                flex: 1,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("id", style: style))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    decoration: decorationHead,
                                    child: Text("nome", style: style))),
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
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['esito'],
                                                style: style))),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['id'].toString(),
                                                style: style))),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            decoration: decoration,
                                            child: SelectableText(
                                                list[index]['name'],
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
                          outputLead(list);
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
