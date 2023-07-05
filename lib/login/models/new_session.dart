class Session {
  String? sessionId;

  Session({this.sessionId});

  Session.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    return data;
  }
}