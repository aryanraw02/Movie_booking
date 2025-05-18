/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-17 21:05:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: non_constant_identifier_names

import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:sqflite/sqflite.dart';

///
/// A helper class for managing the SQLite database operations.
///
class DbHelper {
  // Table name and column definitions for the "tickets" table.
  static final TABLE_NAME = "tickets";
  static final COL_ID = "id";
  static final COL_SHOW_NAME = "movie_name";
  static final COL_SHOW_BANNER = "movie_banner";
  static final COL_SHOW_TIME_SLOT = "movie_time_slot";
  static final COL_BOOK_TIME = "book_time";
  static final COL_CINE_NAME = "cine_name";
  static final COL_SEAT = "seat";

  // The database instance that will be initialized and used throughout the app.
  static late Database _db;

  /// Callback function that is executed when the database is created for the first time.
  /// It creates the "tickets" table with all the defined columns.
  static _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE "$TABLE_NAME" ( "$COL_ID" INTEGER PRIMARY KEY AUTOINCREMENT, '
      '"$COL_SHOW_NAME" TEXT, "$COL_SHOW_BANNER" TEXT, "$COL_SHOW_TIME_SLOT" TEXT, '
      '"$COL_BOOK_TIME" INTEGER, "$COL_CINE_NAME" TEXT, "$COL_SEAT" TEXT );',
    );

    // Log the creation of the database with the current version.
    LogHelper.debug(tag: "DbHelper", message: '_onCreate. version $version');
  }

  /// Initializes the SQLite database.
  /// This function opens the database file named 'cinemabooking.db' and sets up the database schema.
  /// If the database does not exist, the [_onCreate] callback is triggered to create the necessary tables.
  static Future init() async {
    _db = await openDatabase(
      'cinemabooking.db',
      version: 1,
      singleInstance: true,
      onCreate: _onCreate,
    );

    // The lines below (currently commented out) can be used to retrieve and log ticket data.
    // var result = await sl<AllTicketsService>().getAllTicketsData();
    // LogHelper.debug(tag: "DbHelper", message: result.toString());
  }

  /// Provides access to the initialized database instance.
  static Database get db => _db;
}
