class DataM {
  List<Movie> movie;
  List<App> app;
  List<Book> book;

  DataM({this.movie, this.app, this.book});

  DataM.fromJson(Map<String, dynamic> json) {
    if (json['movie'] != null) {
      movie = new List<Movie>();
      json['movie'].forEach((v) {
        movie.add(new Movie.fromJson(v));
      });
    }
    if (json['app'] != null) {
      app = new List<App>();
      json['app'].forEach((v) {
        app.add(new App.fromJson(v));
      });
    }
    if (json['book'] != null) {
      book = new List<Book>();
      json['book'].forEach((v) {
        book.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie.map((v) => v.toJson()).toList();
    }
    if (this.app != null) {
      data['app'] = this.app.map((v) => v.toJson()).toList();
    }
    if (this.book != null) {
      data['book'] = this.book.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  String des;
  String imageurl;
  String name;
  bool complete;

  Movie({this.des, this.imageurl, this.name, this.complete});

  Movie.fromJson(Map<String, dynamic> json) {
    des = json['Des'];
    imageurl = json['Imageurl'];
    name = json['Name'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Des'] = this.des;
    data['Imageurl'] = this.imageurl;
    data['Name'] = this.name;
    data['complete'] = this.complete;
    return data;
  }
}

class App {
  String des;
  String imageurl;
  String name;
  bool complete;

  App({this.des, this.imageurl, this.name, this.complete});

  App.fromJson(Map<String, dynamic> json) {
    des = json['Des'];
    imageurl = json['Imageurl'];
    name = json['Name'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Des'] = this.des;
    data['Imageurl'] = this.imageurl;
    data['Name'] = this.name;
    data['complete'] = this.complete;
    return data;
  }
}

class Book {
  String des;
  String imageurl;
  String name;
  bool complete;

  Book({this.des, this.imageurl, this.name, this.complete});

  Book.fromJson(Map<String, dynamic> json) {
    des = json['Des'];
    imageurl = json['Imageurl'];
    name = json['Name'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Des'] = this.des;
    data['Imageurl'] = this.imageurl;
    data['Name'] = this.name;
    data['complete'] = this.complete;
    return data;
  }
}
