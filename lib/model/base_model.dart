class WordModel {
  String? title;
  String? meaning;
  String? id;

  WordModel(this.title, this.meaning, this.id);

  WordModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    meaning = json['meaning'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['meaning'] = this.meaning;
    data['id'] = this.id;
    return data;
  }
}
