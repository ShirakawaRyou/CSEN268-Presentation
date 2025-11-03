import 'package:flutter/material.dart';

class AnimatedOpacityCard extends StatefulWidget {
  const AnimatedOpacityCard({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityCard> createState() => _AnimatedOpacityCardState();
}

class _AnimatedOpacityCardState extends State<AnimatedOpacityCard> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Animation: AnimatedOpacity',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () => setState(() { _visible = !_visible; }),
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.2,
                    duration: Duration(seconds: 1),
                    child: FlutterLogo(size: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
