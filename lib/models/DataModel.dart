class DataModel {
  String? title;
  String? imageUrl;
  String? description;

  DataModel({this.title, this.imageUrl, this.description});

  DataModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    imageUrl = json['ImageUrl'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['ImageUrl'] = this.imageUrl;
    data['Description'] = this.description;
    return data;
  }
}
