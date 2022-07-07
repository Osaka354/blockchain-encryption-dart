class MetaDataModel {
  MetaDataModel({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory MetaDataModel.fromJson(Map<String, dynamic> json) => MetaDataModel(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"] == null ? null : int.tryParse(json["per_page"].toString()),
        to: json["to"],
        total: json["total"],
      );
}

class LinksModel {
  LinksModel({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

