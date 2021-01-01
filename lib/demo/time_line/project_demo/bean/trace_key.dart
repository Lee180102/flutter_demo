class TraceKey {
  String fieldName;
  String fieldComments;

  TraceKey.fromJson(Map<String, dynamic> json)
      : fieldName = json["fieldName"],
        fieldComments = json["fieldComments"];

  static List<TraceKey> allFromJson(List jsonList) {
    return jsonList.map((json) => TraceKey.fromJson(json)).toList();
  }
}
