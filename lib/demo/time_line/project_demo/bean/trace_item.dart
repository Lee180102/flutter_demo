import 'package:flutter_demo/demo/time_line/project_demo/bean/trace_key.dart';
import 'package:flutter_demo/demo/time_line/project_demo/bean/trace_value.dart';

class TraceItem {
  TraceKey key;
  TraceValue value;

  TraceItem.fromJson(Map<String, dynamic> json):
        key = TraceKey.fromJson(json["key"]),
        value = TraceValue.fromJson(json["value"]);

  static List<TraceItem> allFromJson(List jsonList) {
    return jsonList.map((json) => TraceItem.fromJson(json)).toList();
  }
}
