import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String img;
  final String subject;
  final VoidCallback onTap;

  const ImageCard({
    super.key,
    required this.img,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/$img',
          fit: BoxFit.fitWidth,
        ),
        Container(
          width: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade600.withOpacity(0.7),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Text(
              subject,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
