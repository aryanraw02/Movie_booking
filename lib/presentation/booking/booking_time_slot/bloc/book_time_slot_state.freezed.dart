// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_time_slot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookTimeSlotState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BookTimeSlotEntity> get list => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  bool get movieSearchField => throw _privateConstructorUsedError;
  bool get isOpenBookSeatTypeScreen => throw _privateConstructorUsedError;

  /// Create a copy of BookTimeSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookTimeSlotStateCopyWith<BookTimeSlotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookTimeSlotStateCopyWith<$Res> {
  factory $BookTimeSlotStateCopyWith(
    BookTimeSlotState value,
    $Res Function(BookTimeSlotState) then,
  ) = _$BookTimeSlotStateCopyWithImpl<$Res, BookTimeSlotState>;
  @useResult
  $Res call({
    bool isLoading,
    List<BookTimeSlotEntity> list,
    String? msg,
    bool movieSearchField,
    bool isOpenBookSeatTypeScreen,
  });
}

/// @nodoc
class _$BookTimeSlotStateCopyWithImpl<$Res, $Val extends BookTimeSlotState>
    implements $BookTimeSlotStateCopyWith<$Res> {
  _$BookTimeSlotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookTimeSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
    Object? msg = freezed,
    Object? movieSearchField = null,
    Object? isOpenBookSeatTypeScreen = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            list:
                null == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<BookTimeSlotEntity>,
            msg:
                freezed == msg
                    ? _value.msg
                    : msg // ignore: cast_nullable_to_non_nullable
                        as String?,
            movieSearchField:
                null == movieSearchField
                    ? _value.movieSearchField
                    : movieSearchField // ignore: cast_nullable_to_non_nullable
                        as bool,
            isOpenBookSeatTypeScreen:
                null == isOpenBookSeatTypeScreen
                    ? _value.isOpenBookSeatTypeScreen
                    : isOpenBookSeatTypeScreen // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookTimeSlotStateImplCopyWith<$Res>
    implements $BookTimeSlotStateCopyWith<$Res> {
  factory _$$BookTimeSlotStateImplCopyWith(
    _$BookTimeSlotStateImpl value,
    $Res Function(_$BookTimeSlotStateImpl) then,
  ) = __$$BookTimeSlotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<BookTimeSlotEntity> list,
    String? msg,
    bool movieSearchField,
    bool isOpenBookSeatTypeScreen,
  });
}

/// @nodoc
class __$$BookTimeSlotStateImplCopyWithImpl<$Res>
    extends _$BookTimeSlotStateCopyWithImpl<$Res, _$BookTimeSlotStateImpl>
    implements _$$BookTimeSlotStateImplCopyWith<$Res> {
  __$$BookTimeSlotStateImplCopyWithImpl(
    _$BookTimeSlotStateImpl _value,
    $Res Function(_$BookTimeSlotStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookTimeSlotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
    Object? msg = freezed,
    Object? movieSearchField = null,
    Object? isOpenBookSeatTypeScreen = null,
  }) {
    return _then(
      _$BookTimeSlotStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        list:
            null == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<BookTimeSlotEntity>,
        msg:
            freezed == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                    as String?,
        movieSearchField:
            null == movieSearchField
                ? _value.movieSearchField
                : movieSearchField // ignore: cast_nullable_to_non_nullable
                    as bool,
        isOpenBookSeatTypeScreen:
            null == isOpenBookSeatTypeScreen
                ? _value.isOpenBookSeatTypeScreen
                : isOpenBookSeatTypeScreen // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BookTimeSlotStateImpl implements _BookTimeSlotState {
  const _$BookTimeSlotStateImpl({
    this.isLoading = false,
    final List<BookTimeSlotEntity> list = const [],
    this.msg,
    this.movieSearchField = false,
    this.isOpenBookSeatTypeScreen = false,
  }) : _list = list;

  @override
  @JsonKey()
  final bool isLoading;
  final List<BookTimeSlotEntity> _list;
  @override
  @JsonKey()
  List<BookTimeSlotEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final String? msg;
  @override
  @JsonKey()
  final bool movieSearchField;
  @override
  @JsonKey()
  final bool isOpenBookSeatTypeScreen;

  @override
  String toString() {
    return 'BookTimeSlotState(isLoading: $isLoading, list: $list, msg: $msg, movieSearchField: $movieSearchField, isOpenBookSeatTypeScreen: $isOpenBookSeatTypeScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookTimeSlotStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.movieSearchField, movieSearchField) ||
                other.movieSearchField == movieSearchField) &&
            (identical(
                  other.isOpenBookSeatTypeScreen,
                  isOpenBookSeatTypeScreen,
                ) ||
                other.isOpenBookSeatTypeScreen == isOpenBookSeatTypeScreen));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_list),
    msg,
    movieSearchField,
    isOpenBookSeatTypeScreen,
  );

  /// Create a copy of BookTimeSlotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookTimeSlotStateImplCopyWith<_$BookTimeSlotStateImpl> get copyWith =>
      __$$BookTimeSlotStateImplCopyWithImpl<_$BookTimeSlotStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BookTimeSlotState implements BookTimeSlotState {
  const factory _BookTimeSlotState({
    final bool isLoading,
    final List<BookTimeSlotEntity> list,
    final String? msg,
    final bool movieSearchField,
    final bool isOpenBookSeatTypeScreen,
  }) = _$BookTimeSlotStateImpl;

  @override
  bool get isLoading;
  @override
  List<BookTimeSlotEntity> get list;
  @override
  String? get msg;
  @override
  bool get movieSearchField;
  @override
  bool get isOpenBookSeatTypeScreen;

  /// Create a copy of BookTimeSlotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookTimeSlotStateImplCopyWith<_$BookTimeSlotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
