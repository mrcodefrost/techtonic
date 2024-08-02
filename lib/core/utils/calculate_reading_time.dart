int calculateReadingTime(String content) {
  // logic based on separation of words \n

  final wordCount = content.split(RegExp(r'\s+')).length;

  // speed = d/t
  final readingTime = wordCount / 225;

  return readingTime.ceil(); // round off to highest possible
}
