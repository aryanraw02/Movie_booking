// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_seat_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookSeatTypeState {
  MovieEntity? get movie => throw _privateConstructorUsedError;
  TimeSlotEntity? get selectedTimeSlot => throw _privateConstructorUsedError;
  BookTimeSlotEntity? get bookTimeSlot => throw _privateConstructorUsedError;
  int get seatCount => throw _privateConstructorUsedError;
  TypeSeat get selectedSeatType => throw _privateConstructorUsedError;
  bool get isOpenBookSeatSlotScreen => throw _privateConstructorUsedError;

  /// Create a copy of BookSeatTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSeatTypeStateCopyWith<BookSeatTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSeatTypeStateCopyWith<$Res> {
  factory $BookSeatTypeStateCopyWith(
    BookSeatTypeState value,
    $Res Function(BookSeatTypeState) then,
  ) = _$BookSeatTypeStateCopyWithImpl<$Res, BookSeatTypeState>;
  @useResult
  $Res call({
    MovieEntity? movie,
    TimeSlotEntity? selectedTimeSlot,
    BookTimeSlotEntity? bookTimeSlot,
    int seatCount,
    TypeSeat selectedSeatType,
    bool isOpenBookSeatSlotScreen,
  });
}

/// @nodoc
class _$BookSeatTypeStateCopyWithImpl<$Res, $Val extends BookSeatTypeState>
    implements $BookSeatTypeStateCopyWith<$Res> {
  _$BookSeatTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSeatTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? selectedTimeSlot = freezed,
    Object? bookTimeSlot = freezed,
    Object? seatCount = null,
    Object? selectedSeatType = null,
    Object? isOpenBookSeatSlotScreen = null,
  }) {
    return _then(
      _value.copyWith(
            movie:
                freezed == movie
                    ? _value.movie
                    : movie // ignore: cast_nullable_to_non_nullable
                        as MovieEntity?,
            selectedTimeSlot:
                freezed == selectedTimeSlot
                    ? _value.selectedTimeSlot
                    : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
                        as TimeSlotEntity?,
            bookTimeSlot:
                freezed == bookTimeSlot
                    ? _value.bookTimeSlot
                    : bookTimeSlot // ignore: cast_nullable_to_non_nullable
                        as BookTimeSlotEntity?,
            seatCount:
                null == seatCount
                    ? _value.seatCount
                    : seatCount // ignore: cast_nullable_to_non_nullable
                        as int,
            selectedSeatType:
                null == selectedSeatType
                    ? _value.selectedSeatType
                    : selectedSeatType // ignore: cast_nullable_to_non_nullable
                        as TypeSeat,
            isOpenBookSeatSlotScreen:
                null == isOpenBookSeatSlotScreen
                    ? _value.isOpenBookSeatSlotScreen
                    : isOpenBookSeatSlotScreen // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookSeatTypeStateImplCopyWith<$Res>
    implements $BookSeatTypeStateCopyWith<$Res> {
  factory _$$BookSeatTypeStateImplCopyWith(
    _$BookSeatTypeStateImpl value,
    $Res Function(_$BookSeatTypeStateImpl) then,
  ) = __$$BookSeatTypeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MovieEntity? movie,
    TimeSlotEntity? selectedTimeSlot,
    BookTimeSlotEntity? bookTimeSlot,
    int seatCount,
    TypeSeat selectedSeatType,
    bool isOpenBookSeatSlotScreen,
  });
}

/// @nodoc
class __$$BookSeatTypeStateImplCopyWithImpl<$Res>
    extends _$BookSeatTypeStateCopyWithImpl<$Res, _$BookSeatTypeStateImpl>
    implements _$$BookSeatTypeStateImplCopyWith<$Res> {
  __$$BookSeatTypeStateImplCopyWithImpl(
    _$BookSeatTypeStateImpl _value,
    $Res Function(_$BookSeatTypeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookSeatTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? selectedTimeSlot = freezed,
    Object? bookTimeSlot = freezed,
    Object? seatCount = null,
    Object? selectedSeatType = null,
    Object? isOpenBookSeatSlotScreen = null,
  }) {
    return _then(
      _$BookSeatTypeStateImpl(
        movie:
            freezed == movie
                ? _value.movie
                : movie // ignore: cast_nullable_to_non_nullable
                    as MovieEntity?,
        selectedTimeSlot:
            freezed == selectedTimeSlot
                ? _value.selectedTimeSlot
                : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
                    as TimeSlotEntity?,
        bookTimeSlot:
            freezed == bookTimeSlot
                ? _value.bookTimeSlot
                : bookTimeSlot // ignore: cast_nullable_to_non_nullable
                    as BookTimeSlotEntity?,
        seatCount:
            null == seatCount
                ? _value.seatCount
                : seatCount // ignore: cast_nullable_to_non_nullable
                    as int,
        selectedSeatType:
            null == selectedSeatType
                ? _value.selectedSeatType
                : selectedSeatType // ignore: cast_nullable_to_non_nullable
                    as TypeSeat,
        isOpenBookSeatSlotScreen:
            null == isOpenBookSeatSlotScreen
                ? _value.isOpenBookSeatSlotScreen
                : isOpenBookSeatSlotScreen // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BookSeatTypeStateImpl implements _BookSeatTypeState {
  const _$BookSeatTypeStateImpl({
    this.movie,
    this.selectedTimeSlot,
    this.bookTimeSlot,
    this.seatCount = 2,
    this.selectedSeatType = TypeSeat.king,
    this.isOpenBookSeatSlotScreen = false,
  });

  @override
  final MovieEntity? movie;
  @override
  final TimeSlotEntity? selectedTimeSlot;
  @override
  final BookTimeSlotEntity? bookTimeSlot;
  @override
  @JsonKey()
  final int seatCount;
  @override
  @JsonKey()
  final TypeSeat selectedSeatType;
  @override
  @JsonKey()
  final bool isOpenBookSeatSlotScreen;

  @override
  String toString() {
    return 'BookSeatTypeState(movie: $movie, selectedTimeSlot: $selectedTimeSlot, bookTimeSlot: $bookTimeSlot, seatCount: $seatCount, selectedSeatType: $selectedSeatType, isOpenBookSeatSlotScreen: $isOpenBookSeatSlotScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSeatTypeStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.bookTimeSlot, bookTimeSlot) ||
                other.bookTimeSlot == bookTimeSlot) &&
            (identical(other.seatCount, seatCount) ||
                other.seatCount == seatCount) &&
            (identical(other.selectedSeatType, selectedSeatType) ||
                other.selectedSeatType == selectedSeatType) &&
            (identical(
                  other.isOpenBookSeatSlotScreen,
                  isOpenBookSeatSlotScreen,
                ) ||
                other.isOpenBookSeatSlotScreen == isOpenBookSeatSlotScreen));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    movie,
    selectedTimeSlot,
    bookTimeSlot,
    seatCount,
    selectedSeatType,
    isOpenBookSeatSlotScreen,
  );

  /// Create a copy of BookSeatTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSeatTypeStateImplCopyWith<_$BookSeatTypeStateImpl> get copyWith =>
      __$$BookSeatTypeStateImplCopyWithImpl<_$BookSeatTypeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BookSeatTypeState implements BookSeatTypeState {
  const factory _BookSeatTypeState({
    final MovieEntity? movie,
    final TimeSlotEntity? selectedTimeSlot,
    final BookTimeSlotEntity? bookTimeSlot,
    final int seatCount,
    final TypeSeat selectedSeatType,
    final bool isOpenBookSeatSlotScreen,
  }) = _$BookSeatTypeStateImpl;

  @override
  MovieEntity? get movie;
  @override
  TimeSlotEntity? get selectedTimeSlot;
  @override
  BookTimeSlotEntity? get bookTimeSlot;
  @override
  int get seatCount;
  @override
  TypeSeat get selectedSeatType;
  @override
  bool get isOpenBookSeatSlotScreen;

  /// Create a copy of BookSeatTypeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSeatTypeStateImplCopyWith<_$BookSeatTypeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
