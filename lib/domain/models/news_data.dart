class NewsData {
  String? createdAt;
  String? titleAr;
  String? titleEn;
  String? contentAr;
  String? contentEn;
  String? image;
  String? id;

  NewsData(
      {this.createdAt,
      this.titleAr,
      this.titleEn,
      this.contentAr,
      this.contentEn,
      this.image,
      this.id});

  NewsData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    contentAr = json['content_ar'];
    contentEn = json['content_en'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['content_ar'] = this.contentAr;
    data['content_en'] = this.contentEn;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
