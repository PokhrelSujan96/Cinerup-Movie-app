class Movie {
  String? title;
  String? description;
  String? cast;
  String? quality;
  String? genre;
  String? topname;
  String? image;
  String? thumbnail;
  String? video;
  String? category;
  String? language;

  Link? link;

  Movie(
      {this.title,
      this.description,
      this.cast,
      this.quality,
      this.genre,
      this.topname,
      this.image,
      this.thumbnail,
      this.video,
      this.category,
      this.language,
      this.link});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    cast = json['cast'];
    quality = json['quality'];
    genre = json['genre'];
    topname = json['topname'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    video = json['video'];
    category = json['category'];
    language = json['language'];
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['cast'] = this.cast;
    data['quality'] = this.quality;
    data['genre'] = this.genre;
    data['topname'] = this.topname;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['video'] = this.video;
    data['category'] = this.category;
    data['language'] = this.language;
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    return data;
  }
}

class Link {
  String? s1080p;
  String? s720p;
  String? s480p;

  Link({this.s1080p, this.s720p, this.s480p});

  Link.fromJson(Map<String, dynamic> json) {
    s1080p = json['1080p'];
    s720p = json['720p'];
    s480p = json['480p'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['1080p'] = this.s1080p;
    data['720p'] = this.s720p;
    data['480p'] = this.s480p;
    return data;
  }
}