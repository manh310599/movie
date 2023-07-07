class TotalPage {
  int? totalPages;

  TotalPage({this.totalPages});

  TotalPage.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_pages'] = totalPages;
    return data;
  }
}
