class Author {
  late int id;
  late String full_name;
  late String short_bio;
  late String dates_alive;
  late String image;

  Author(this.id, this.full_name, this.short_bio, this.dates_alive, this.image);

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      json['id'],
      json['full_name'],
      json['short_bio'],
      json['dates_alive'],
      json['image'],
    );
  }
}
