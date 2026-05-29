class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String userPhoto;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final List<String> interestedUsers;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhoto = '',
    required this.title,
    required this.description,
    required this.category,
    this.imageUrl = '',
    this.interestedUsers = const [],
    required this.createdAt,
  });

  factory PostModel.fromMap(Map<String, dynamic> map, String docId) {
    return PostModel(
      id: docId,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPhoto: map['userPhoto'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      interestedUsers: List<String>.from(map['interestedUsers'] ?? []),
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhoto': userPhoto,
      'title': title,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'interestedUsers': interestedUsers,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
