import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/presentation/about_page/user_info_screen.dart';
import 'package:cinema_booking/presentation/all_movies/sc_all_movies.dart';
import 'package:cinema_booking/presentation/all_tickets/screen_all_tickets.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_slot/book_seat_slot_screen.dart';
import 'package:cinema_booking/presentation/booking/booking_seat_type/book_seat_type_screen.dart';
import 'package:cinema_booking/presentation/booking/booking_time_slot/book_time_slot_main.dart';
import 'package:cinema_booking/presentation/auth_guard.dart';
import 'package:cinema_booking/presentation/home/home.dart';
import 'package:cinema_booking/presentation/intro/get_started.dart';
import 'package:cinema_booking/presentation/login/login.dart';
import 'package:cinema_booking/presentation/movie_detail/movie_detail_info.dart';
import 'package:cinema_booking/presentation/register/register.dart';
import 'package:cinema_booking/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routerNeglect: false,
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/get-started',
      builder: (context, state) => const GetStartedPage(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/',
      builder: (context, state) => const AuthGuard(child: HomeScreen()),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const AuthGuard(child: UserInfoScreen()),
    ),
    GoRoute(
      path: '/allMovies',
      builder: (context, state) => const AuthGuard(child: AllMoviesScreen()),
    ),
    GoRoute(
      path: '/listTickets',
      builder: (context, state) => const AuthGuard(child: ListTicketsScreen()),
    ),
    GoRoute(
      path: '/bookSeatType',
      builder: (context, state) => const AuthGuard(child: BookSeatTypeScreen()),
    ),
    GoRoute(
      path: '/bookSeatSlot',
      builder: (context, state) {
        final args = state.extra as ScreenArguments?;
        return AuthGuard(
          child:
              args == null
                  ? const Scaffold(
                    body: Center(child: Text("Invalid arguments")),
                  )
                  : BookSeatSlotScreen(args: args),
        );
      },
    ),
    GoRoute(
      path: '/bookTimeSlot',
      builder: (context, state) {
        final movie = state.extra as MovieEntity?;
        return AuthGuard(
          child:
              movie == null
                  ? const Scaffold(
                    body: Center(child: Text("Invalid movie data")),
                  )
                  : BookTimeSlotScreen(movie: movie),
        );
      },
    ),
    GoRoute(
      path: '/movie',
      builder: (context, state) {
        final movieDetail = state.extra as MovieDetailEntity?;
        return AuthGuard(
          child:
              movieDetail == null
                  ? const Scaffold(
                    body: Center(child: Text("Invalid movie data")),
                  )
                  : MovieInfoScreen(movie: movieDetail),
        );
      },
    ),
  ],
);
