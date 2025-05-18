/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:cinema_booking/presentation/home/home_banner/bloc/home_banner_bloc.dart';
import 'package:cinema_booking/presentation/home/home_banner/widget_home_banner.dart';
import 'package:cinema_booking/presentation/home/home_genres/bloc/home_genres_bloc.dart';
import 'package:cinema_booking/presentation/home/home_genres/widget_home_categories.dart';
import 'package:cinema_booking/presentation/home/home_movies_genres/bloc/home_movies_genres_bloc.dart';
import 'package:cinema_booking/presentation/home/home_movies_genres/widget_home_movies_genres.dart';
import 'package:cinema_booking/presentation/home/nearby_cinema/widget_nearby_cinema.dart';
import 'package:cinema_booking/presentation/home/recommended_movies/bloc/recommended_movies_bloc.dart';
import 'package:cinema_booking/presentation/home/recommended_movies/widget_recommended_movies.dart';
import 'package:cinema_booking/presentation/home/widgets/widget_home_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBloc>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBannerBloc(homeBloc: homeBloc)),
        BlocProvider(create: (context) => HomeGenresBloc(homeBloc: homeBloc)),
        BlocProvider(
          create: (context) => RecommendedMoviesBloc(homeBloc: homeBloc),
        ),
        BlocProvider(
          create: (context) => HomeMoviesGenresBloc(homeBloc: homeBloc),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: AppColors.darkBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[WidgetHomeToolbar(), _buildContent(state)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomeState state) {
    if (state is HomeLoaded) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HomeBloc>(context).add(RefreshHome());
          },
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              WidgetHomeBanner(),
              WidgetSpacer(height: 20),
              WidgetHomeGenres(),
              WidgetSpacer(height: 20),
              WidgetRecommendedMovies(),
              WidgetSpacer(height: 20),
              WidgetNearbyCine(),
              WidgetSpacer(height: 30),
              WidgetHomeMoviesGenres(),
              WidgetSpacer(height: 20),
            ],
          ),
        ),
      );
    } else if (state is HomeLoading) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    } else if (state is HomeNotLoaded) {
      return Expanded(child: Center(child: Text('Cannot load data')));
    } else {
      return Expanded(child: Center(child: Text('Unknown state')));
    }
  }
}
