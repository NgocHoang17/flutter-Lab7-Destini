import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab07_destini/main.dart';
import 'package:lab07_destini/story_brain.dart';

void main() {
  test('Mọi nhánh tới đúng kết thúc và có thể reset', () {
    for (final route in [
      [1, 1, 3],
      [1, 2, 4],
      [2, 1, 4],
      [2, 2, 5],
    ]) {
      final brain = StoryBrain();
      brain.nextStory(route[0]);
      brain.nextStory(route[1]);
      expect(brain.storyNumber, route[2]);
      expect(brain.currentStory.isEnding, isTrue);
      expect(brain.showSecondChoice, isFalse);
      brain.restart();
      expect(brain.storyNumber, 0);
      expect(brain.showSecondChoice, isTrue);
    }
  });
  testWidgets('Đến kết thúc chỉ có nút Bắt đầu lại', (tester) async {
    await tester.pumpWidget(const DestiniApp());
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.byKey(const Key('choice-1')));
      await tester.pump();
    }
    expect(find.text('Người giữ ánh sáng'), findsOneWidget);
    expect(find.byKey(const Key('choice-2')), findsNothing);
    expect(find.byType(TextButton), findsOneWidget);
    await tester.tap(find.text('Bắt đầu lại'));
    await tester.pump();
    expect(find.text('Ngã rẽ dưới trăng'), findsOneWidget);
    expect(find.byKey(const Key('choice-2')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
