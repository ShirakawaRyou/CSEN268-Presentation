import 'package:flutter/material.dart';

class AnimatedContainerCard extends StatefulWidget {
  const AnimatedContainerCard({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerCard> createState() => _AnimatedContainerCardState();
}

class _AnimatedContainerCardState extends State<AnimatedContainerCard> {
  bool _large = false;

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
                'AnimatedContainer',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () => setState(() { _large = !_large; }),
                  child: AnimatedContainer(
                    width: _large ? 100 : 50,
                    height: _large ? 100 : 50,
                    color: _large ? Colors.blue : Colors.red,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
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
