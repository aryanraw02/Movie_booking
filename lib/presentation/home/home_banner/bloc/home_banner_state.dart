/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_banner_bloc.dart';

class HomeBannerState extends Equatable {
  const HomeBannerState();

  @override
  List<Object> get props => [];
}

class HomeBannerNotLoaded extends HomeBannerState {}

class HomeBannerLoaded extends HomeBannerState {
  final List<BannerEntity> banners;

  const HomeBannerLoaded(this.banners);

  @override
  List<Object> get props => [banners];
}
