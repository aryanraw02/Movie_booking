/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_banner_bloc.dart';

class HomeBannerEvent extends Equatable {
  const HomeBannerEvent();

  @override
  List<Object> get props => [];
}

class DisplayHomeBanner extends HomeBannerEvent {
  final List<BannerEntity> banners;

  const DisplayHomeBanner({required this.banners});

  @override
  List<Object> get props => [banners];
}
