class Story {
  const Story({
    required this.title,
    required this.storyTitle,
    this.choice1 = '',
    this.choice2 = '',
    this.nextStory1,
    this.nextStory2,
  });
  final String title;
  final String storyTitle;
  final String choice1;
  final String choice2;
  final int? nextStory1;
  final int? nextStory2;
  bool get isEnding => nextStory1 == null && nextStory2 == null;
}
