class JokeResponse {
  bool error;
  String category;
  String type;
  String joke;
  Flags flags;
  int id;
  bool safe;
  String lang;

  JokeResponse(
      {this.error,
      this.category,
      this.type,
      this.joke,
      this.flags,
      this.id,
      this.safe,
      this.lang});

  JokeResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    category = json['category'];
    type = json['type'];
    joke = json['joke'];
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    id = json['id'];
    safe = json['safe'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['category'] = this.category;
    data['type'] = this.type;
    data['joke'] = this.joke;
    if (this.flags != null) {
      data['flags'] = this.flags.toJson();
    }
    data['id'] = this.id;
    data['safe'] = this.safe;
    data['lang'] = this.lang;
    return data;
  }
}

class Flags {
  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  Flags(
      {this.nsfw,
      this.religious,
      this.political,
      this.racist,
      this.sexist,
      this.explicit});

  Flags.fromJson(Map<String, dynamic> json) {
    nsfw = json['nsfw'];
    religious = json['religious'];
    political = json['political'];
    racist = json['racist'];
    sexist = json['sexist'];
    explicit = json['explicit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nsfw'] = this.nsfw;
    data['religious'] = this.religious;
    data['political'] = this.political;
    data['racist'] = this.racist;
    data['sexist'] = this.sexist;
    data['explicit'] = this.explicit;
    return data;
  }
}
