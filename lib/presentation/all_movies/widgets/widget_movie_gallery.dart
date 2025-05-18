/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/paint/rounded_rect_indicator.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/response/all_mobie_by_type.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/presentation/all_movies/widgets/widget_list_movies.dart';
import 'package:flutter/material.dart';

class WidgetMovieGallery extends StatefulWidget {
  final AllMoviesEntity meta;

  const WidgetMovieGallery({super.key, required this.meta});

  @override
  State<WidgetMovieGallery> createState() => _WidgetMovieGalleryState();
}

class _WidgetMovieGalleryState extends State<WidgetMovieGallery>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int currentTabIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {
        currentTabIndex = _controller.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTabs(),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              _listMoviesToContent(widget.meta.nowMovieing),
              _listMoviesToContent(widget.meta.comingSoon),
              _listMoviesToContent(widget.meta.exclusive),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listMoviesToContent(List<MovieDetailEntity> movies) {
    if (movies.isNotEmpty) {
      return WidgetListMovie(
        movies.map((movie) => ItemMovieVM.fromMovie(movie)).toList(),
      );
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text('No data', style: AppFont.regular_gray4_14),
        ),
      );
    }
  }

  _buildTabs() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        controller: _controller,
        tabs: <Widget>[
          Tab(text: 'Now Showing'),
          Tab(text: 'Coming Soon'),
          Tab(text: 'Exclusive'),
        ],
        labelColor: AppColors.defaultColor,
        labelStyle: AppFont.medium_default.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: Colors.grey.shade500,
        unselectedLabelStyle: AppFont.regular_gray1_12.copyWith(fontSize: 14),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: RoundedRectIndicator(
          color: AppColors.defaultColor,
          radius: 4,
          padding: 24,
          weight: 4.0,
        ),
      ),
    );
  }
}
