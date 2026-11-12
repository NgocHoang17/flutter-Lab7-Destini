import 'package:flutter/material.dart';
import 'story_brain.dart';

// Flutter application entry point.
void main() => runApp(const DestiniApp());

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Destini • Dưới ánh trăng',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF7BBEBB),
        brightness: Brightness.dark,
      ),
    ),
    home: const StoryPage(),
  );
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final _brain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    final story = _brain.currentStory;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.nights_stay_outlined, size: 22),
                        SizedBox(width: 10),
                        Text('DESTINI / 07'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xDB101E2A),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                story.isEnding
                                    ? 'ĐOẠN KẾT'
                                    : 'CHƯƠNG ${_brain.storyNumber + 1}',
                                style: const TextStyle(
                                  color: Color(0xFF9EDCD2),
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                story.title,
                                key: const Key('story-title'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                story.storyTitle,
                                style: const TextStyle(
                                  fontSize: 19,
                                  height: 1.65,
                                  color: Color(0xFFF2EDE4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      key: const Key('choice-1'),
                      onPressed: () => setState(() {
                        if (story.isEnding) {
                          _brain.restart();
                        } else {
                          _brain.nextStory(1);
                        }
                      }),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFC64F4A),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 60),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: Text(
                        story.isEnding ? 'Bắt đầu lại' : story.choice1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Visibility(
                      visible: _brain.showSecondChoice,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: TextButton(
                          key: const Key('choice-2'),
                          onPressed: () => setState(() => _brain.nextStory(2)),
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF206879),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 60),
                            padding: const EdgeInsets.all(16),
                          ),
                          child: Text(
                            story.choice2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
