class TraceValue {
  String uuid;
  String name;

  TraceValue.fromJson(Map<String, dynamic> json)
      : uuid = json["uuid"],
        name = json["name"];

  static List<TraceValue> allFromJson(List jsonList) {
    return jsonList.map((json) => TraceValue.fromJson(json)).toList();
  }
}
