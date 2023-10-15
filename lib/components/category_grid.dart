import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        children: [
          HomeCategoryCard(
            title: "미술품",
            icon: Icons.photo_outlined,
            onTap: () => {},
          ),
          HomeCategoryCard(
            title: "명품가방",
            icon: Icons.shopping_bag,
            onTap: () => {},
          ),
          HomeCategoryCard(
            title: "부동산",
            icon: Icons.location_city_outlined,
            onTap: () => {},
          ),
          HomeCategoryCard(
            title: "음원",
            icon: Icons.music_note_outlined,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}

class HomeCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
            spreadRadius: -3.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {},
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
