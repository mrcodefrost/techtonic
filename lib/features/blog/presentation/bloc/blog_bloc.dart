import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtonic_blog_app/core/error/failures.dart';
import 'package:techtonic_blog_app/core/usecase/usecase.dart';

import '../../domain/entities/blog.dart';
import '../../domain/usecase/get_all_blogs.dart';
import '../../domain/usecase/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,

        // call params in constructor before the super
        super(BlogInitial()) {
    // first we just start with the loading event
    // so that it is not required to be called multiple
    // times at different places
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_onBlogUpload);
    on<BlogGetAllBlogsEvent>(_onGetAllBlogs);
  }
  void _onBlogUpload(
    BlogUploadEvent event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _uploadBlog(UploadBlogParams(
      posterId: event.posterId,
      title: event.title,
      content: event.content,
      image: event.image,
      topics: event.topics,
    ));

    res.fold(
        (l) => emit(BlogFailure(l.message)),
        (r) => emit(
              BlogUploadSuccess(),
            ));
  }

  void _onGetAllBlogs(
    BlogGetAllBlogsEvent event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _getAllBlogs(NoParams());

    res.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogDisplaySuccess(r)));
  }
}
