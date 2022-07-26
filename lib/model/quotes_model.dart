///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class QuotesModelResults {
/*
{
  "tags": [
    "famous-quotes"
  ],
  "_id": "2xpHvSOQMD",
  "author": "Helmut Schmidt",
  "content": "The biggest room in the world is room for improvement.",
  "authorSlug": "helmut-schmidt",
  "length": 54,
  "dateAdded": "2021-06-18",
  "dateModified": "2021-06-18"
} 
*/

  List<String?>? tags;
  String? Id;
  String? author;
  String? content;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuotesModelResults({
    this.tags,
    this.Id,
    this.author,
    this.content,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });
  QuotesModelResults.fromJson(Map<String, dynamic> json) {
  if (json['tags'] != null) {
  final v = json['tags'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    tags = arr0;
    }
    Id = json['_id']?.toString();
    author = json['author']?.toString();
    content = json['content']?.toString();
    authorSlug = json['authorSlug']?.toString();
    length = json['length']?.toInt();
    dateAdded = json['dateAdded']?.toString();
    dateModified = json['dateModified']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (tags != null) {
      final v = tags;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['tags'] = arr0;
    }
    data['_id'] = Id;
    data['author'] = author;
    data['content'] = content;
    data['authorSlug'] = authorSlug;
    data['length'] = length;
    data['dateAdded'] = dateAdded;
    data['dateModified'] = dateModified;
    return data;
  }
}

class QuotesModel {
/*
{
  "count": 20,
  "totalCount": 1885,
  "page": 1,
  "totalPages": 95,
  "lastItemIndex": 20,
  "results": [
    {
      "tags": [
        "famous-quotes"
      ],
      "_id": "2xpHvSOQMD",
      "author": "Helmut Schmidt",
      "content": "The biggest room in the world is room for improvement.",
      "authorSlug": "helmut-schmidt",
      "length": 54,
      "dateAdded": "2021-06-18",
      "dateModified": "2021-06-18"
    }
  ]
} 
*/

  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  int? lastItemIndex;
  List<QuotesModelResults?>? results;

  QuotesModel({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });
  QuotesModel.fromJson(Map<String, dynamic> json) {
    count = json['count']?.toInt();
    totalCount = json['totalCount']?.toInt();
    page = json['page']?.toInt();
    totalPages = json['totalPages']?.toInt();
    lastItemIndex = json['lastItemIndex']?.toInt();
  if (json['results'] != null) {
  final v = json['results'];
  final arr0 = <QuotesModelResults>[];
  v.forEach((v) {
  arr0.add(QuotesModelResults.fromJson(v));
  });
    results = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['totalCount'] = totalCount;
    data['page'] = page;
    data['totalPages'] = totalPages;
    data['lastItemIndex'] = lastItemIndex;
    if (results != null) {
      final v = results;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['results'] = arr0;
    }
    return data;
  }
}
