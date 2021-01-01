import 'package:flutter_demo/demo/time_line/project_demo/bean/trace_item.dart';

class Trace {
  String uuid;
  String businessType;
  String businessTypeName;
  String content;
  String businessTime;
  String businessUuid;
  String containerRecordUuid;
  List<TraceItem> itemList;

  Trace.fromJson(Map<String, dynamic> json):
        uuid = json["uuid"],
        businessType = json["businessType"],
        businessTypeName = json["businessTypeName"],
        content = json["content"],
        businessTime = json["businessTime"].toString(),
        businessUuid = json["businessUuid"],
        containerRecordUuid = json["containerRecordUuid"],
        itemList = TraceItem.allFromJson(json["itemList"]);

  static List<Trace> allFromJson(List jsonList) {
    return jsonList.map((json) => Trace.fromJson(json)).toList();
  }

}
