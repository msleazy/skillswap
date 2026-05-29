import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/post_model.dart';
import '../core/app_constants.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener todas las publicaciones en tiempo real
  Stream<List<PostModel>> getPosts() {
    return _firestore
        .collection(AppConstants.postsCollection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostModel.fromMap(doc.data(), doc.id))
            .toList());
  }

  // Obtener publicaciones por categoría
  Stream<List<PostModel>> getPostsByCategory(String category) {
    return _firestore
        .collection(AppConstants.postsCollection)
        .where('category', isEqualTo: category)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostModel.fromMap(doc.data(), doc.id))
            .toList());
  }

  // Crear publicación
  Future<bool> createPost(PostModel post) async {
    try {
      await _firestore
          .collection(AppConstants.postsCollection)
          .add(post.toMap());
      return true;
    } catch (e) {
      debugPrint('Error en createPost: $e');
      return false;
    }
  }

  // Marcar interés en una publicación
  Future<void> toggleInterest(String postId, String userId) async {
    final ref = _firestore
        .collection(AppConstants.postsCollection)
        .doc(postId);

    final doc = await ref.get();
    final List<String> interested =
        List<String>.from(doc.data()?['interestedUsers'] ?? []);

    if (interested.contains(userId)) {
      interested.remove(userId);
    } else {
      interested.add(userId);
    }

    await ref.update({'interestedUsers': interested});
  }
}
