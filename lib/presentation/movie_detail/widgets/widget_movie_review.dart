/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';
import 'package:cinema_booking/common/helpers/formatter_helpers.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';

class WidgetMovieReview extends StatelessWidget {
  final MovieDetailEntity movie;

  const WidgetMovieReview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String textReviews =
        "${movie.totalReviews.formatDecimalThousand()} reviews";
    String authorAvatar = movie.latestReviews.avatar;
    String authorName = movie.latestReviews.author;
    String content = movie.latestReviews.content;
    String textDate = movie.latestReviews.created.MMM_dd_yyyy();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.9),
            Colors.black.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 12,
            spreadRadius: -4,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Reviews Count & Write Button
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  textReviews,
                  style: AppFont.semibold_white_16.copyWith(
                    shadows: [Shadow(color: Colors.black38, blurRadius: 6)],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle write review action
                },
                child: Text(
                  'Write yours >',
                  style: AppFont.medium_white_12.copyWith(
                    color: AppColors.defaultColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          WidgetSpacer(height: 14),

          // User Avatar & Review Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Avatar with Glow Effect
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    authorAvatar,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              WidgetSpacer(width: 12),

              // Review Content
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Author Name & Date
                    Row(
                      children: <Widget>[
                        Text(authorName, style: AppFont.semibold_white_16),
                        WidgetSpacer(width: 8),
                        Text(
                          textDate,
                          style: AppFont.regular_gray1_12.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    WidgetSpacer(height: 4),

                    // Review Text with Fade Effect
                    ExpandableReviewText(content: content),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandableReviewText extends StatefulWidget {
  final String content;

  const ExpandableReviewText({super.key, required this.content});

  @override
  State<ExpandableReviewText> createState() => _ExpandableReviewTextState();
}

class _ExpandableReviewTextState extends State<ExpandableReviewText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded; // Toggle expand/collapse
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        padding: EdgeInsets.all(8),
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: Text(
            widget.content,
            style: TextStyle(color: Colors.white, fontSize: 14),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(
            widget.content,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}
