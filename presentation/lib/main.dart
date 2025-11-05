import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'explicit animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AnimationDemoPage(),
    );
  }
}

class AnimationDemoPage extends StatefulWidget {
  const AnimationDemoPage({super.key});
  @override
  State<AnimationDemoPage> createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedBox() {
    return Container(
      width: _animation.value,
      height: _animation.value,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: const Text(
        'animation',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('explicit animation control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildAnimatedBox(),
            const SizedBox(height: 40),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.forward(),
                  child: const Text('start'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.stop(),
                  child: const Text('stop'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.status == AnimationStatus.dismissed
                      ? _controller.forward()
                      : _controller.reverse(),
                  child: const Text('reverse'),
                ),
                ElevatedButton(
                  onPressed: () => _controller.reset(),
                  child: const Text('reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
