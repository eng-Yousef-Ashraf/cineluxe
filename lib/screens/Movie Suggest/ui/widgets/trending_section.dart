import 'package:cineluxe/utils/app_colors.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TrendingMovieCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String year;

  const TrendingMovieCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            colors: [Colors.black.withOpacity(.95), Colors.transparent],
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(title, style: AppStyles.white20Bold.copyWith(fontSize: 18)),

            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.star, color: AppColors.yellowColor, size: 18),

                const SizedBox(width: 4),

                Text(rating, style: AppStyles.yellow14W400),

                const Spacer(),

                Text(year, style: AppStyles.white14W400),
              ],
            ),

            const SizedBox(height: 14),

            Container(
              height: 42,

              decoration: BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.circular(14),
              ),

              child: const Center(
                child: Icon(Icons.play_arrow, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
