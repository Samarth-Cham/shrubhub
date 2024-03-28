class PostData {
  final String ImageURL;
  final String caption;
  final List<String> TagList;
  final String author;
  final List<String> comments;
  final bool isLiked;
  final bool isBookmarked;
  final String description;

  PostData({
    required this.ImageURL,
    required this.caption,
    required this.TagList,
    required this.description,
    required this.author,
    required this.comments,
    required this.isLiked,
    required this.isBookmarked,
  });

  Map<String, dynamic> toJson() => {
        'ImageURL': ImageURL,
        'caption': caption,
        'TagList': TagList,
        'author': author,
        'comments': comments,
        'isLiked': isLiked,
        'isBookmarked': isBookmarked,
        'description': description,
      };

  static PostData fromJson(Map<String, dynamic> json) {
    print(json['TagList'].runtimeType );
    print(json['comments'].runtimeType);
    print(json["TagList"][0].runtimeType);
    return PostData(
        ImageURL: json['ImageURL'],
        caption: json['caption'],
        TagList: (json['TagList'] as List<dynamic>?)?.cast<String>() ?? [],
        description: json['description'],
        author: json['author'],
        comments: (json['comments'] as List<dynamic>?)?.cast<String>() ?? [],
        isLiked: json['isLiked'],
        isBookmarked: json['isBookmarked']);
  }
}

List<PostData> postData = [
  PostData(
      TagList: ["Tag1"],
      author: "samcham123",
      comments: ["nice!"],
      isLiked: true,
      isBookmarked: true,
      description: "desc",
      ImageURL:
          "https://images.unsplash.com/photo-1604762524889-3e2fcc145683?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      caption: "caption"),
  PostData(
      TagList: ["Tag1"],
      author: "samcham123",
      comments: ["nice!"],
      isLiked: true,
      isBookmarked: true,
      description: "desc",
      ImageURL:
          "https://images.unsplash.com/photo-1604762524889-3e2fcc145683?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      caption: "caption"),
  PostData(
      TagList: ["Tag1"],
      author: "samcham123",
      comments: ["nice!"],
      isLiked: true,
      isBookmarked: true,
      description: "desc",
      ImageURL:
          "https://images.unsplash.com/photo-1604762524889-3e2fcc145683?q=80&w=1771&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      caption: "caption"),
];
