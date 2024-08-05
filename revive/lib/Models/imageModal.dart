class ImageModel {
  String id;
  String title;
  String url;

  ImageModel({
    required this.id,
    required this.title,
    required this.url,
  });
 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      title: map['title'],
      url: map['url'],
    );
  }
}
