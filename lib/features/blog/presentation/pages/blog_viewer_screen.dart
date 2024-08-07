import 'package:flutter/material.dart';
import 'package:techtonic_blog_app/core/theme/app_palette.dart';
import 'package:techtonic_blog_app/core/utils/calculate_reading_time.dart';
import 'package:techtonic_blog_app/core/utils/format_date.dart';

import '../../domain/entities/blog.dart';

class BlogViewerScreen extends StatelessWidget {
  static route(Blog blog) => MaterialPageRoute(
      builder: (context) => BlogViewerScreen(
            blog: blog,
          ));

  final Blog blog;
  const BlogViewerScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'By ${blog.posterName}',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  '${formatDateByDMMMYYYY(blog.updatedAt)} \n${calculateReadingTime(blog.content)} min read',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppPalette.greyColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(blog.imageUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  blog.content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
