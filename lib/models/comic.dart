/// Model representation of a comic from XKCD.
/// It holds the title of the comic, the alt text and the img in XKCD server for the file
class Comic {
  final int num;
  final String title;
  final String alt;
  final String img;

  Comic({this.num, this.title, this.alt, this.img})
      : assert(title != null && title.trim().isNotEmpty, 'A title is required'),
        assert(alt != null && alt.trim().isNotEmpty, 'An alt text is required'),
        assert(img != null && img.trim().isNotEmpty, 'An image is required'),
        assert(num != null && num > 0, 'Invalid comic number');

  /// Provides a new comic from a JSON
  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        num: json['num'],
        title: json['title'],
        alt: json['alt'],
        img: json['img'],
      );

  /// If no comic was found...
  factory Comic.notFound() => Comic(
        num: 404,
        title: 'Not found',
        alt: 'Not found. Realy',
        img: '404',
      );

  @override
  int get hashCode {
    int seed = 17;
    int hash = seed * num;
    hash += title.hashCode + img.hashCode;
    hash = hash ~/ seed;
    return seed * (hash + alt.hashCode);
  }

  @override
  bool operator ==(other) {
    if (other == null) return false;
    if (other is! Comic) return false;
    Comic that = other;
    return (num == that.num &&
        title == that.title &&
        img == that.img &&
        alt == that.alt);
  }
}
