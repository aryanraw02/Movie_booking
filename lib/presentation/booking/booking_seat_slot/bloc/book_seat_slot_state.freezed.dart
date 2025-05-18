// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_seat_slot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookSeatSlotState {
  MovieEntity? get movie => throw _privateConstructorUsedError;
  TimeSlotEntity? get selectedTimeSlot => throw _privateConstructorUsedError;
  BookTimeSlotEntity? get bookTimeSlot => throw _privateConstructorUsedError; //
  bool get isLoading => throw _privateConstructorUsedError;
  List<ItemGridSeatSlotVM> get itemGridSeatSlotVMs =>
      throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError; //
  bool get isSelectWrongSeatType => throw _privateConstructorUsedError;
  bool get isReachedLimitSeatSlot => throw _privateConstructorUsedError; //
  List<String> get selectedSeatIds => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError; //
  bool get isOpenPaymentMethod => throw _privateConstructorUsedError;

  /// Create a copy of BookSeatSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSeatSlotStateCopyWith<BookSeatSlotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSeatSlotStateCopyWith<$Res> {
  factory $BookSeatSlotStateCopyWith(
    BookSeatSlotState value,
    $Res Function(BookSeatSlotState) then,
  ) = _$BookSeatSlotStateCopyWithImpl<$Res, BookSeatSlotState>;
  @useResult
  $Res call({
    MovieEntity? movie,
    TimeSlotEntity? selectedTimeSlot,
    BookTimeSlotEntity? bookTimeSlot,
    bool isLoading,
    List<ItemGridSeatSlotVM> itemGridSeatSlotVMs,
    String? msg,
    bool isSelectWrongSeatType,
    bool isReachedLimitSeatSlot,
    List<String> selectedSeatIds,
    double totalPrice,
    bool isOpenPaymentMethod,
  });
}

/// @nodoc
class _$BookSeatSlotStateCopyWithImpl<$Res, $Val extends BookSeatSlotState>
    implements $BookSeatSlotStateCopyWith<$Res> {
  _$BookSeatSlotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSeatSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? selectedTimeSlot = freezed,
    Object? bookTimeSlot = freezed,
    Object? isLoading = null,
    Object? itemGridSeatSlotVMs = null,
    Object? msg = freezed,
    Object? isSelectWrongSeatType = null,
    Object? isReachedLimitSeatSlot = null,
    Object? selectedSeatIds = null,
    Object? totalPrice = null,
    Object? isOpenPaymentMethod = null,
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
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            itemGridSeatSlotVMs:
                null == itemGridSeatSlotVMs
                    ? _value.itemGridSeatSlotVMs
                    : itemGridSeatSlotVMs // ignore: cast_nullable_to_non_nullable
                        as List<ItemGridSeatSlotVM>,
            msg:
                freezed == msg
                    ? _value.msg
                    : msg // ignore: cast_nullable_to_non_nullable
                        as String?,
            isSelectWrongSeatType:
                null == isSelectWrongSeatType
                    ? _value.isSelectWrongSeatType
                    : isSelectWrongSeatType // ignore: cast_nullable_to_non_nullable
                        as bool,
            isReachedLimitSeatSlot:
                null == isReachedLimitSeatSlot
                    ? _value.isReachedLimitSeatSlot
                    : isReachedLimitSeatSlot // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedSeatIds:
                null == selectedSeatIds
                    ? _value.selectedSeatIds
                    : selectedSeatIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            totalPrice:
                null == totalPrice
                    ? _value.totalPrice
                    : totalPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            isOpenPaymentMethod:
                null == isOpenPaymentMethod
                    ? _value.isOpenPaymentMethod
                    : isOpenPaymentMethod // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookSeatSlotStateImplCopyWith<$Res>
    implements $BookSeatSlotStateCopyWith<$Res> {
  factory _$$BookSeatSlotStateImplCopyWith(
    _$BookSeatSlotStateImpl value,
    $Res Function(_$BookSeatSlotStateImpl) then,
  ) = __$$BookSeatSlotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MovieEntity? movie,
    TimeSlotEntity? selectedTimeSlot,
    BookTimeSlotEntity? bookTimeSlot,
    bool isLoading,
    List<ItemGridSeatSlotVM> itemGridSeatSlotVMs,
    String? msg,
    bool isSelectWrongSeatType,
    bool isReachedLimitSeatSlot,
    List<String> selectedSeatIds,
    double totalPrice,
    bool isOpenPaymentMethod,
  });
}

/// @nodoc
class __$$BookSeatSlotStateImplCopyWithImpl<$Res>
    extends _$BookSeatSlotStateCopyWithImpl<$Res, _$BookSeatSlotStateImpl>
    implements _$$BookSeatSlotStateImplCopyWith<$Res> {
  __$$BookSeatSlotStateImplCopyWithImpl(
    _$BookSeatSlotStateImpl _value,
    $Res Function(_$BookSeatSlotStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookSeatSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = freezed,
    Object? selectedTimeSlot = freezed,
    Object? bookTimeSlot = freezed,
    Object? isLoading = null,
    Object? itemGridSeatSlotVMs = null,
    Object? msg = freezed,
    Object? isSelectWrongSeatType = null,
    Object? isReachedLimitSeatSlot = null,
    Object? selectedSeatIds = null,
    Object? totalPrice = null,
    Object? isOpenPaymentMethod = null,
  }) {
    return _then(
      _$BookSeatSlotStateImpl(
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
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        itemGridSeatSlotVMs:
            null == itemGridSeatSlotVMs
                ? _value._itemGridSeatSlotVMs
                : itemGridSeatSlotVMs // ignore: cast_nullable_to_non_nullable
                    as List<ItemGridSeatSlotVM>,
        msg:
            freezed == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                    as String?,
        isSelectWrongSeatType:
            null == isSelectWrongSeatType
                ? _value.isSelectWrongSeatType
                : isSelectWrongSeatType // ignore: cast_nullable_to_non_nullable
                    as bool,
        isReachedLimitSeatSlot:
            null == isReachedLimitSeatSlot
                ? _value.isReachedLimitSeatSlot
                : isReachedLimitSeatSlot // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedSeatIds:
            null == selectedSeatIds
                ? _value._selectedSeatIds
                : selectedSeatIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        totalPrice:
            null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        isOpenPaymentMethod:
            null == isOpenPaymentMethod
                ? _value.isOpenPaymentMethod
                : isOpenPaymentMethod // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BookSeatSlotStateImpl implements _BookSeatSlotState {
  const _$BookSeatSlotStateImpl({
    this.movie,
    this.selectedTimeSlot,
    this.bookTimeSlot,
    this.isLoading = false,
    final List<ItemGridSeatSlotVM> itemGridSeatSlotVMs = const [],
    this.msg,
    this.isSelectWrongSeatType = false,
    this.isReachedLimitSeatSlot = false,
    final List<String> selectedSeatIds = const [],
    this.totalPrice = 0,
    this.isOpenPaymentMethod = false,
  }) : _itemGridSeatSlotVMs = itemGridSeatSlotVMs,
       _selectedSeatIds = selectedSeatIds;

  @override
  final MovieEntity? movie;
  @override
  final TimeSlotEntity? selectedTimeSlot;
  @override
  final BookTimeSlotEntity? bookTimeSlot;
  //
  @override
  @JsonKey()
  final bool isLoading;
  final List<ItemGridSeatSlotVM> _itemGridSeatSlotVMs;
  @override
  @JsonKey()
  List<ItemGridSeatSlotVM> get itemGridSeatSlotVMs {
    if (_itemGridSeatSlotVMs is EqualUnmodifiableListView)
      return _itemGridSeatSlotVMs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemGridSeatSlotVMs);
  }

  @override
  final String? msg;
  //
  @override
  @JsonKey()
  final bool isSelectWrongSeatType;
  @override
  @JsonKey()
  final bool isReachedLimitSeatSlot;
  //
  final List<String> _selectedSeatIds;
  //
  @override
  @JsonKey()
  List<String> get selectedSeatIds {
    if (_selectedSeatIds is EqualUnmodifiableListView) return _selectedSeatIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSeatIds);
  }

  @override
  @JsonKey()
  final double totalPrice;
  //
  @override
  @JsonKey()
  final bool isOpenPaymentMethod;

  @override
  String toString() {
    return 'BookSeatSlotState(movie: $movie, selectedTimeSlot: $selectedTimeSlot, bookTimeSlot: $bookTimeSlot, isLoading: $isLoading, itemGridSeatSlotVMs: $itemGridSeatSlotVMs, msg: $msg, isSelectWrongSeatType: $isSelectWrongSeatType, isReachedLimitSeatSlot: $isReachedLimitSeatSlot, selectedSeatIds: $selectedSeatIds, totalPrice: $totalPrice, isOpenPaymentMethod: $isOpenPaymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSeatSlotStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.bookTimeSlot, bookTimeSlot) ||
                other.bookTimeSlot == bookTimeSlot) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
              other._itemGridSeatSlotVMs,
              _itemGridSeatSlotVMs,
            ) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.isSelectWrongSeatType, isSelectWrongSeatType) ||
                other.isSelectWrongSeatType == isSelectWrongSeatType) &&
            (identical(other.isReachedLimitSeatSlot, isReachedLimitSeatSlot) ||
                other.isReachedLimitSeatSlot == isReachedLimitSeatSlot) &&
            const DeepCollectionEquality().equals(
              other._selectedSeatIds,
              _selectedSeatIds,
            ) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.isOpenPaymentMethod, isOpenPaymentMethod) ||
                other.isOpenPaymentMethod == isOpenPaymentMethod));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    movie,
    selectedTimeSlot,
    bookTimeSlot,
    isLoading,
    const DeepCollectionEquality().hash(_itemGridSeatSlotVMs),
    msg,
    isSelectWrongSeatType,
    isReachedLimitSeatSlot,
    const DeepCollectionEquality().hash(_selectedSeatIds),
    totalPrice,
    isOpenPaymentMethod,
  );

  /// Create a copy of BookSeatSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSeatSlotStateImplCopyWith<_$BookSeatSlotStateImpl> get copyWith =>
      __$$BookSeatSlotStateImplCopyWithImpl<_$BookSeatSlotStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BookSeatSlotState implements BookSeatSlotState {
  const factory _BookSeatSlotState({
    final MovieEntity? movie,
    final TimeSlotEntity? selectedTimeSlot,
    final BookTimeSlotEntity? bookTimeSlot,
    final bool isLoading,
    final List<ItemGridSeatSlotVM> itemGridSeatSlotVMs,
    final String? msg,
    final bool isSelectWrongSeatType,
    final bool isReachedLimitSeatSlot,
    final List<String> selectedSeatIds,
    final double totalPrice,
    final bool isOpenPaymentMethod,
  }) = _$BookSeatSlotStateImpl;

  @override
  MovieEntity? get movie;
  @override
  TimeSlotEntity? get selectedTimeSlot;
  @override
  BookTimeSlotEntity? get bookTimeSlot; //
  @override
  bool get isLoading;
  @override
  List<ItemGridSeatSlotVM> get itemGridSeatSlotVMs;
  @override
  String? get msg; //
  @override
  bool get isSelectWrongSeatType;
  @override
  bool get isReachedLimitSeatSlot; //
  @override
  List<String> get selectedSeatIds;
  @override
  double get totalPrice; //
  @override
  bool get isOpenPaymentMethod;

  /// Create a copy of BookSeatSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSeatSlotStateImplCopyWith<_$BookSeatSlotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
