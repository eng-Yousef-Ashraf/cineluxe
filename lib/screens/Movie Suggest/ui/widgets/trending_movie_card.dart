import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

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
      width: 220,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            colors: [Colors.black.withOpacity(.95), Colors.transparent],
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Text(
              title,

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

              style: AppStyles.white20Bold,
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.star, color: AppColors.yellowColor, size: 18),

                const SizedBox(width: 4),

                Text(rating, style: AppStyles.yellow14W400),

                const Spacer(),

                Text(
                  year.length >= 4 ? year.substring(0, 4) : "",

                  style: AppStyles.white14W400,
                ),
              ],
            ),

            const SizedBox(height: 14),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

              decoration: BoxDecoration(
                color: AppColors.yellowColor,

                borderRadius: BorderRadius.circular(14),
              ),

              child: Text("Watch Now", style: AppStyles.black16W400),
            ),
          ],
        ),
      ),
    );
  }
}
