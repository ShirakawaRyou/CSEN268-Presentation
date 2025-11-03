import 'package:flutter/material.dart';

class AnimatedAlignCard extends StatefulWidget {
  const AnimatedAlignCard({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignCard> createState() => _AnimatedAlignCardState();
}

class _AnimatedAlignCardState extends State<AnimatedAlignCard> {
  bool _aligned = false;

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
                'AnimatedAlign',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Container(
                height: 80,
                child: GestureDetector(
                  onTap: () => setState(() { _aligned = !_aligned; }),
                  child: AnimatedAlign(
                    alignment: _aligned ? Alignment.topRight : Alignment.bottomLeft,
                    duration: Duration(seconds: 1),
                    child: FlutterLogo(size: 40),
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
