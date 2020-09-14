class ImageItem {
  final String id;
  final String fullSize;
  final String thumbSize;
  final String regularSize;
  final String description;
  final String author;

  ImageItem({this.id, this.fullSize, this.thumbSize, this.regularSize, this.description, this.author});

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'],
      fullSize: json['urls']['full'],
      thumbSize: json['urls']['thumb'],
      regularSize: json['urls']['regular'],
      description: json['alt_description'],
      author: json['user']['name'],
    );
  }
}