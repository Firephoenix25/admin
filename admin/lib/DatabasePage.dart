import 'package:flutter/material.dart';
import 'CloudFirestore.dart';
import 'Extensions.dart';
//pages
import 'Pages/ClosedCallTable.dart';
import 'Pages/NotAnswered.dart';
import 'Pages/ToRecallTable.dart';
import 'Pages/RecallMeeting.dart';
import 'Pages/MeetingTable.dart';

class DatabasePage extends StatelessWidget {
  final String page;
  DatabasePage({this.page});

  @override
  Widget build(BuildContext context) {
    if (page == "ClosedCall") return ClosedCallTable(future: readClosedCall());

    if (page == "NotAnswered")
      return NotAnsweredTable(future: readNotAnswered());
    if (page == "ToRecall") return ToRecallTable(future: readToRecall());
    if (page == "RecallMeeting")
      return RecallMeetingTable(future: readRecallMeeting());
    if (page == "Meeting") return MeetingTable(future: readMeeting());

    return Center(
      child: Text("NothingFinded"),
    );
  }
}
