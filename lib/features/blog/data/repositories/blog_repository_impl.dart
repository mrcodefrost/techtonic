import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:techtonic_blog_app/core/error/exceptions.dart';
import 'package:techtonic_blog_app/core/error/failures.dart';
import 'package:techtonic_blog_app/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:techtonic_blog_app/features/blog/data/models/blog_model.dart';
import 'package:techtonic_blog_app/features/blog/domain/entities/blog.dart';
import 'package:techtonic_blog_app/features/blog/domain/repositories/blog_repository.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  BlogRepositoryImpl(this.blogRemoteDataSource);

  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(), // creates random id based on current time
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: '',
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final imageUrl = await blogRemoteDataSource.uploadBlogImage(image: image, blog: blogModel);

      blogModel = blogModel.copyWith(
        imageUrl: imageUrl,
      );

      final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);

      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Blog>>> getAllBlogs() async {
    try {
      final blogs = await blogRemoteDataSource.getAllBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
