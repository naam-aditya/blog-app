import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignFloatingText extends StatelessWidget {
  final String messageText;
  final String clickableText;
  final Function() recognizer;

  const SignFloatingText({
    super.key,
    required this.messageText,
    required this.clickableText,
    required this.recognizer,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$messageText ',
        style: Theme.of(context).textTheme.titleMedium,
        children: [
          TextSpan(
            text: clickableText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                recognizer();
              },
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ),
    );
  }
}
