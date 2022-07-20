import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final Icon icon;
  final Color iconColor;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: iconColor.withOpacity(0.3),
              ),
              height: 48,
              width: 48,
              child: IconTheme(
                data: IconThemeData(
                  color: iconColor,
                ),
                child: icon,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8.0),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.headline6?.apply(
                fontWeightDelta: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}