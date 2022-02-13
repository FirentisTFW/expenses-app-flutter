class Category {
  final int id;
  final String name;
  final int iconId;

  const Category({
    this.id,
    this.name,
    this.iconId,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['catName'],
        iconId = json['iconId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'catName': name,
        'iconId': iconId,
      };
}
