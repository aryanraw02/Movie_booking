/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/api/dio_provider.dart';
import 'package:cinema_booking/core/local/pref.dart';
import 'package:cinema_booking/data/repository/all_movie/all_movie_repository_impl.dart';
import 'package:cinema_booking/data/repository/auth/auth_repository_impl.dart';
import 'package:cinema_booking/data/repository/authentication/authentication_repository_impl.dart';
import 'package:cinema_booking/data/repository/booking_time/booking_time_repository_impl.dart';
import 'package:cinema_booking/data/repository/home/home_repository_impl.dart';
import 'package:cinema_booking/data/repository/movie/movie_info_repository_impl.dart';
import 'package:cinema_booking/data/repository/tickets/tickets_repository_impl.dart';
import 'package:cinema_booking/data/sources/authentication/authentication_service.dart';
import 'package:cinema_booking/data/sources/all_movie/all_movie_service.dart';
import 'package:cinema_booking/data/sources/auth/auth_service.dart';
import 'package:cinema_booking/data/sources/booking_time/mock_book_time_slot_service.dart';
import 'package:cinema_booking/data/sources/booking_time/remote_booking_time_service.dart';
import 'package:cinema_booking/data/sources/booking_time/session_service.dart';
import 'package:cinema_booking/data/sources/home/home_service.dart';
import 'package:cinema_booking/data/sources/movie/movie_info_service.dart';
import 'package:cinema_booking/data/sources/ticket/ticket_service.dart';
import 'package:cinema_booking/domain/repository/authentication/authentication.dart';
import 'package:cinema_booking/domain/repository/all_movie/all_movie.dart';
import 'package:cinema_booking/domain/repository/auth/auth.dart';
import 'package:cinema_booking/domain/repository/booking_time/book_time_slot.dart';
import 'package:cinema_booking/domain/repository/home/home.dart';
import 'package:cinema_booking/domain/repository/movie/movie.dart';
import 'package:cinema_booking/domain/repository/seat_slot/seat_slot_repository.dart';
import 'package:cinema_booking/domain/repository/tickets/tickets.dart';
import 'package:cinema_booking/domain/usecase/all_movie/get_all_movie.dart';
import 'package:cinema_booking/domain/usecase/user/edit_user_info.dart';
import 'package:cinema_booking/domain/usecase/user/get_user.dart';
import 'package:cinema_booking/domain/usecase/user/login_google.dart';
import 'package:cinema_booking/domain/usecase/user/signin.dart';
import 'package:cinema_booking/domain/usecase/user/signup.dart';
import 'package:cinema_booking/domain/usecase/authentication/is_signed_in.dart';
import 'package:cinema_booking/domain/usecase/booking_time/cache_book_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/cache_selected_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/cache_show.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_all_shows_by_type.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_book_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_selected_time_slot.dart';
import 'package:cinema_booking/domain/usecase/booking_time/get_cached_show.dart';
import 'package:cinema_booking/domain/usecase/booking_time/mock_book_time.dart';
import 'package:cinema_booking/domain/usecase/home/get_home_data.dart';
import 'package:cinema_booking/domain/usecase/movie/cache_movie_info_data.dart';
import 'package:cinema_booking/domain/usecase/tickets/create_ticket.dart';
import 'package:cinema_booking/domain/usecase/tickets/get_all_tickets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

final firestore = FirebaseFirestore.instance;

final localDio = DioProvider.instance();

Future<void> initializeDependencies() async {
  // Authentication
  sl.registerSingleton<AuthenticationService>(AuthenticationServiceImpl());
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl());
  sl.registerSingleton<IsSignedInUsecase>(IsSignedInUsecase());

  // Login
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<AuthService>(AuthServiceImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<LoginWithGoogleUsecase>(LoginWithGoogleUsecase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<EditUserInfoUseCase>(EditUserInfoUseCase());

  // home
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl());
  sl.registerSingleton<HomeService>(HomeServiceImpl());
  sl.registerSingleton<GetHomeDataUseCase>(GetHomeDataUseCase());

  // Booking time and ticket cinema
  sl.registerSingleton<BookTimeSlotRepository>(BookTimeSlotRepositoryImpl());
  sl.registerSingleton<SeatSlotRepository>(RemoteSeatSlotRepository());

  sl.registerSingleton<MockBookTimeSlotService>(MockBookTimeSlotServiceImpl());
  sl.registerSingleton<RemoteBookTimeSlotService>(RemoteBookTimeSlotServiceImpl());
  sl.registerSingleton<SessionService>(SessionServiceImpl(pref: LocalPref()));
  sl.registerSingleton<CacheBookTimeSlotUseCase>(CacheBookTimeSlotUseCase());
  sl.registerSingleton<CacheMovieUseCase>(CacheMovieUseCase());

  sl.registerSingleton<GetAllMoviesByTypeUseCase>(GetAllMoviesByTypeUseCase());
  sl.registerSingleton<GetCachedBookTimeSlotUseCase>(GetCachedBookTimeSlotUseCase());
  sl.registerSingleton<GetCachedSelectedTimeSlotUseCase>(GetCachedSelectedTimeSlotUseCase());
  sl.registerSingleton<GetCachedMovieUseCase>(GetCachedMovieUseCase());
  sl.registerSingleton<MockBookTimeSlotUseCase>(MockBookTimeSlotUseCase());
  sl.registerSingleton<CacheSelectedTimeSlotUseCase>(CacheSelectedTimeSlotUseCase());

  // movie
  sl.registerSingleton<MovieInfoService>(MovieInfoServiceImpl(pref: LocalPref()));
  sl.registerSingleton<MovieInfoRepository>(MovieInfoRepositoryImpl());
  sl.registerSingleton<CacheMovieInfoDataUseCase>(CacheMovieInfoDataUseCase());

  // all movie
  sl.registerSingleton<AllMoviesService>(AllMoviesServiceImpl());
  sl.registerSingleton<AllMoviesRepository>(AllMoviesRepositoryImpl());
  sl.registerSingleton<GetAllMoviesDataUseCase>(GetAllMoviesDataUseCase());

  // tickets
  sl.registerSingleton<AllTicketsService>(AllTicketsServiceImpl());
  sl.registerSingleton<AllTicketsRepository>(AllTicketsRepositoryImpl());
  sl.registerSingleton<GetAllTicketsDataUseCase>(GetAllTicketsDataUseCase());
  sl.registerSingleton<CreateTicketUseCase>(CreateTicketUseCase());
}
