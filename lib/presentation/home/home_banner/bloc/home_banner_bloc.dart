/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/domain/entities/movies/banner.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_banner_event.dart';
part 'home_banner_state.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  final HomeBloc homeBloc;
  late StreamSubscription _subscription;

  HomeBannerBloc({required this.homeBloc}) : super(HomeBannerNotLoaded()) {
    on<DisplayHomeBanner>(_onDisplayHomeBanner);

    if (homeBloc.state is HomeLoaded) {
      final state = homeBloc.state as HomeLoaded;
      add(DisplayHomeBanner(banners: state.homeState.banners));
    } else {
      _subscription = homeBloc.stream.listen((state) {
        if (state is HomeLoaded) {
          add(DisplayHomeBanner(banners: state.homeState.banners));
        }
      });
    }
  }

  Future<void> _onDisplayHomeBanner(
    DisplayHomeBanner event,
    Emitter<HomeBannerState> emit,
  ) async {
    emit(HomeBannerLoaded(event.banners));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
