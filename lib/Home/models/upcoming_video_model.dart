class UpComingVideoModel {
  int? id;
  List<ResultsVideo>? results;

  UpComingVideoModel({this.id, this.results});

  UpComingVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <ResultsVideo>[];
      json['results'].forEach((v) {
        results!.add(new ResultsVideo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultsVideo {
  String? key;

  ResultsVideo({this.key});

  ResultsVideo.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    return data;
  }
}
