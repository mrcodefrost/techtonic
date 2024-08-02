import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:techtonic_blog_app/core/error/exceptions.dart';
import 'package:techtonic_blog_app/features/blog/data/models/blog_model.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  });
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;
  BlogRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData = await supabaseClient.from('blogs').insert(blog.toJson()).select();

      return BlogModel.fromJson(blogData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage({required File image, required BlogModel blog}) async {
    try {
      // the path here refers to the path in the supabase storage (bucket) - blog.id
      // using blog.id as there will be only 1 image per blog
      await supabaseClient.storage.from('blog_images').upload(blog.id, image);

      return supabaseClient.storage.from('blog_images').getPublicUrl(blog.id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      // get all blog data and then use the poster_id to get the 'names' from 'profiles' table.
      final blogs = await supabaseClient.from('blogs').select('*, profiles (name)'); // performing the joint operation
      return blogs
          .map(
            (blog) => BlogModel.fromJson(blog).copyWith(
              // to know the correct way of getting values
              // from maps is to just print it
              posterName: blog['profiles']['name'],
            ),
          )
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
