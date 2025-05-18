/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/formatter_helpers.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';

class WidgetMovieDesc extends StatelessWidget {
  final MovieDetailEntity movie;

  const WidgetMovieDesc({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.85),
            Colors.black.withValues(alpha: 0.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 4, child: _buildMovieNameDate()),
              Expanded(flex: 1, child: _buildLikeVotes()),
            ],
          ),
          WidgetSpacer(height: 14),
          _buildTagList(),
          WidgetSpacer(height: 12),
          _buildExtraInfo(),
        ],
      ),
    );
  }

  _buildMovieNameDate() {
    final name = movie.detail.name;
    final textDate = movie.detail.releaseDate.MMM_dd_yyyy();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: AppFont.semibold_white_18.copyWith(
            shadows: [Shadow(color: Colors.black38, blurRadius: 4)],
          ),
        ),
        WidgetSpacer(height: 6),
        Text(textDate, style: AppFont.regular_gray4_12),
      ],
    );
  }

  _buildLikeVotes() {
    final textRating = "${movie.detail.rate}%";
    final textVotes = movie.detail.votes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.favorite, size: 20, color: AppColors.defaultColor),
            WidgetSpacer(width: 4),
            Text(textRating, style: AppFont.medium_white_16),
          ],
        ),
        WidgetSpacer(height: 6),
        Text(textVotes, style: AppFont.regular_gray4_14),
      ],
    );
  }

  _buildTagList() {
    final List<Widget> itemTamis = [];
    itemTamis.add(Text('Tami', style: AppFont.regular_white_14));
    itemTamis.add(WidgetSpacer(width: 10));

    for (var tami in movie.format) {
      itemTamis.add(_buildTag(tami));
      itemTamis.add(WidgetSpacer(width: 6));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: itemTamis,
    );
  }

  _buildTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withValues(alpha: 0.5),
            blurRadius: 8,
            spreadRadius: -2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: Text(tag, style: AppFont.medium_white_14)),
    );
  }

  _buildExtraInfo() {
    final textDuration = Duration(seconds: movie.detail.duration).formatHHmm();
    final textTag = movie.genres.join(", ").toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.access_time, color: Colors.white70, size: 16),
        WidgetSpacer(width: 6),
        Text(textDuration, style: AppFont.regular_white_12),
        WidgetSpacer(width: 16),
        Icon(Icons.local_movies_outlined, color: Colors.white70, size: 16),
        WidgetSpacer(width: 6),
        Expanded(
          child: Text(
            textTag,
            style: AppFont.regular_white_12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
