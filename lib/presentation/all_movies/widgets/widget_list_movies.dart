/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/shimmer_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/core/constants/responsive_breakpoints.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetListMovie extends StatelessWidget {
  final List<ItemMovieVM> items;

  const WidgetListMovie(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth > kTabletBreakpoint;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isDesktop ? 4 : 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var movie = items[index];
          return _buildMovieCard(movie, context);
        },
      ),
    );
  }

  Widget _buildMovieCard(ItemMovieVM movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        openMovieDetails(movie.movie, context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .5),
              blurRadius: 12,
              spreadRadius: -3,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              ShimmerImage(
                url: movie.photo,
                aspectRatio: 150 / 200,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black..withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 8,
                right: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: AppFont.medium_white_16.copyWith(
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black..withValues(alpha: 0.8),
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    WidgetSpacer(height: 4),

                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColors.defaultColor,
                          size: 16,
                        ),
                        WidgetSpacer(width: 4),
                        Text(
                          '${movie.likePercent} %',
                          style: AppFont.regular_white_12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openMovieDetails(MovieDetailEntity movie, BuildContext context) {
    context.go('/movie', extra: movie);
  }
}

class ItemMovieVM {
  late MovieDetailEntity movie;
  late String photo;
  late String title;
  late int likePercent;

  ItemMovieVM(this.photo, this.title, this.likePercent);

  ItemMovieVM.fromMovie(MovieDetailEntity movieDetail) {
    movie = movieDetail;
    photo = movie.detail.thumb;
    title = movie.detail.name;
    likePercent = movie.detail.rate;
  }
}
