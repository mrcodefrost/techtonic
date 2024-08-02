part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

// always start the naming with the Event suffix (Blog)
// for all new events created
final class BlogUploadEvent extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  BlogUploadEvent({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}

final class BlogGetAllBlogsEvent extends BlogEvent {}
