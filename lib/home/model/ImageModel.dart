class ImageModel {
  int totalHits;
  List<Hits> hits;
  int total;

  ImageModel({this.totalHits, this.hits, this.total});

  ImageModel.fromJson(Map<String, dynamic> json) {
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = new List<Hits>();
      json['hits'].forEach((v) {
        hits.add(new Hits.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalHits'] = this.totalHits;
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Hits {
  String largeImageURL;
  int webformatHeight;
  int webformatWidth;
  int likes;
  int imageWidth;
  int id;
  int userId;
  int views;
  int comments;
  String pageURL;
  int imageHeight;
  String webformatURL;
  String type;
  int previewHeight;
  String tags;
  int downloads;
  String user;
  int favorites;
  int imageSize;
  int previewWidth;
  String userImageURL;
  String previewURL;

  Hits(
      {this.largeImageURL,
      this.webformatHeight,
      this.webformatWidth,
      this.likes,
      this.imageWidth,
      this.id,
      this.userId,
      this.views,
      this.comments,
      this.pageURL,
      this.imageHeight,
      this.webformatURL,
      this.type,
      this.previewHeight,
      this.tags,
      this.downloads,
      this.user,
      this.favorites,
      this.imageSize,
      this.previewWidth,
      this.userImageURL,
      this.previewURL});

  Hits.fromJson(Map<String, dynamic> json) {
    largeImageURL = json['largeImageURL'];
    webformatHeight = json['webformatHeight'];
    webformatWidth = json['webformatWidth'];
    likes = json['likes'];
    imageWidth = json['imageWidth'];
    id = json['id'];
    userId = json['user_id'];
    views = json['views'];
    comments = json['comments'];
    pageURL = json['pageURL'];
    imageHeight = json['imageHeight'];
    webformatURL = json['webformatURL'];
    type = json['type'];
    previewHeight = json['previewHeight'];
    tags = json['tags'];
    downloads = json['downloads'];
    user = json['user'];
    favorites = json['favorites'];
    imageSize = json['imageSize'];
    previewWidth = json['previewWidth'];
    userImageURL = json['userImageURL'];
    previewURL = json['previewURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['largeImageURL'] = this.largeImageURL;
    data['webformatHeight'] = this.webformatHeight;
    data['webformatWidth'] = this.webformatWidth;
    data['likes'] = this.likes;
    data['imageWidth'] = this.imageWidth;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['views'] = this.views;
    data['comments'] = this.comments;
    data['pageURL'] = this.pageURL;
    data['imageHeight'] = this.imageHeight;
    data['webformatURL'] = this.webformatURL;
    data['type'] = this.type;
    data['previewHeight'] = this.previewHeight;
    data['tags'] = this.tags;
    data['downloads'] = this.downloads;
    data['user'] = this.user;
    data['favorites'] = this.favorites;
    data['imageSize'] = this.imageSize;
    data['previewWidth'] = this.previewWidth;
    data['userImageURL'] = this.userImageURL;
    data['previewURL'] = this.previewURL;
    return data;
  }
}
