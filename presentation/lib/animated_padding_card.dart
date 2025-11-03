import 'package:flutter/material.dart';

class AnimatedPaddingCard extends StatefulWidget {
  const AnimatedPaddingCard({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingCard> createState() => _AnimatedPaddingCardState();
}

class _AnimatedPaddingCardState extends State<AnimatedPaddingCard> {
  bool _padded = false;

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
                'AnimatedPadding',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () => setState(() { _padded = !_padded; }),
                  child: AnimatedPadding(
                    padding: EdgeInsets.all(_padded ? 30 : 10),
                    duration: Duration(seconds: 1),
                    child: Container(
                      color: Colors.green,
                      child: FlutterLogo(size: 50),
                    ),
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
