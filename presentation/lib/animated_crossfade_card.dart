import 'package:flutter/material.dart';

class AnimatedCrossFadeCard extends StatefulWidget {
  const AnimatedCrossFadeCard({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeCard> createState() => _AnimatedCrossFadeCardState();
}

class _AnimatedCrossFadeCardState extends State<AnimatedCrossFadeCard> {
  bool _showFirst = true;

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
                'AnimatedCrossFade',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () => setState(() { _showFirst = !_showFirst; }),
                  child: AnimatedCrossFade(
                    firstChild: Icon(Icons.favorite, size: 40, color: Colors.pink),
                    secondChild: Icon(Icons.favorite_border, size: 40, color: Colors.grey),
                    crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: Duration(seconds: 1),
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
