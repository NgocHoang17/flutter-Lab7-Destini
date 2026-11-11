import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;
  final List<Story> _storyData = const [
    Story(
      title: 'Ngã rẽ dưới trăng',
      storyTitle:
          'Chuyến đi bộ cuối ngày đưa bạn tới một ngã rẽ trong thung lũng. Phía trái, ánh đèn hải đăng nhấp nháy sau rừng cây. Phía phải, tiếng chuông nhỏ vọng ra từ một căn nhà gỗ. Trời sắp tối. Bạn sẽ đi đâu?',
      choice1: 'Theo ánh đèn hải đăng',
      nextStory1: 1,
      choice2: 'Tìm căn nhà có tiếng chuông',
      nextStory2: 2,
    ),
    Story(
      title: 'Tín hiệu từ ngọn tháp',
      storyTitle:
          'Bạn đến chân ngọn hải đăng và thấy một người gác đèn đang loay hoay bên cánh cửa kẹt. Ngoài xa, một chiếc thuyền cần tín hiệu dẫn đường. Người gác đèn nhờ bạn giúp. Bên hông tháp còn một lối mòn về làng.',
      choice1: 'Giúp người gác đèn mở cửa',
      nextStory1: 3,
      choice2: 'Theo lối mòn xuống làng',
      nextStory2: 4,
    ),
    Story(
      title: 'Lời mời bên bếp lửa',
      storyTitle:
          'Một bà cụ mở cửa, mời bạn uống trà. Tiếng chuông bạn nghe là của chú mèo nằm bên hiên. Bà chỉ đường về làng và kể về một đài ngắm sao ngay trên đồi. Bầu trời đêm nay trong veo.',
      choice1: 'Cảm ơn bà và trở về làng',
      nextStory1: 4,
      choice2: 'Lên đồi ngắm sao',
      nextStory2: 5,
    ),
    Story(
      title: 'Người giữ ánh sáng',
      storyTitle:
          'Hai người cùng mở được cửa. Ngọn đèn sáng lên đúng lúc chiếc thuyền vào vịnh. Người gác đèn mời bạn nghỉ lại, bên cửa sổ nhìn ra biển. Một việc tử tế đã biến chuyến đi lạc thành kỷ niệm đáng nhớ.',
    ),
    Story(
      title: 'Đường về bình yên',
      storyTitle:
          'Lối mòn dẫn bạn tới quảng trường nhỏ. Quán bánh cuối phố vẫn còn sáng đèn. Bạn mua một chiếc bánh ấm, tìm được chuyến xe về nhà và mang theo câu chuyện về thung lũng dưới trăng.',
    ),
    Story(
      title: 'Một bầu trời mới',
      storyTitle:
          'Trên đồi, bạn gặp một nhóm bạn đang ngắm sao. Họ mời bạn nhìn qua kính thiên văn rồi cùng đưa bạn về làng. Đôi khi một lựa chọn bất ngờ mở ra những tình bạn mới.',
    ),
  ];

  int get storyNumber => _storyNumber;
  Story get currentStory => _storyData[_storyNumber];
  bool get showSecondChoice =>
      !currentStory.isEnding && currentStory.nextStory2 != null;

  void nextStory(int choiceNumber) {
    if (choiceNumber != 1 && choiceNumber != 2) {
      throw ArgumentError.value(
        choiceNumber,
        'choiceNumber',
        'Chỉ có lựa chọn 1 hoặc 2',
      );
    }
    final next = choiceNumber == 1
        ? currentStory.nextStory1
        : currentStory.nextStory2;
    if (next != null) _storyNumber = next;
  }

  void restart() => _storyNumber = 0;
}
