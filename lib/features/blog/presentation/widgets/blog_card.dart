import 'package:flutter/material.dart';
import 'package:techtonic_blog_app/core/utils/calculate_reading_time.dart';

import '../../domain/entities/blog.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;

  const BlogCard({super.key, required this.blog, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16), // out of container
      padding: const EdgeInsets.all(16), // inside the container
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: blog.topics
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: Chip(
                              label: Text(e),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Text(
                blog.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text('${calculateReadingTime(blog.content)} min'),
        ],
      ),
    );
  }
}
