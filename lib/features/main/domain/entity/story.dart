class Story {
  final String storyName;
  final String image;
  final List<StoryItem> list;
  Story({
    required this.storyName,
    required this.image,
    required this.list,
  });
}

class StoryItem {
  final int id;
  final String image;
  final String title;
  final String info;
  final bool hasSeen;

  StoryItem({
    this.id = 0,
    this.image = "",
    this.title = "",
    this.info = "",
    this.hasSeen = false
  });
}
