// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_tickets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListTicketsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Ticket> get data => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  /// Create a copy of ListTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListTicketsStateCopyWith<ListTicketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTicketsStateCopyWith<$Res> {
  factory $ListTicketsStateCopyWith(
    ListTicketsState value,
    $Res Function(ListTicketsState) then,
  ) = _$ListTicketsStateCopyWithImpl<$Res, ListTicketsState>;
  @useResult
  $Res call({bool isLoading, List<Ticket> data, String? msg});
}

/// @nodoc
class _$ListTicketsStateCopyWithImpl<$Res, $Val extends ListTicketsState>
    implements $ListTicketsStateCopyWith<$Res> {
  _$ListTicketsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = null,
    Object? msg = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as List<Ticket>,
            msg:
                freezed == msg
                    ? _value.msg
                    : msg // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ListTicketsStateImplCopyWith<$Res>
    implements $ListTicketsStateCopyWith<$Res> {
  factory _$$ListTicketsStateImplCopyWith(
    _$ListTicketsStateImpl value,
    $Res Function(_$ListTicketsStateImpl) then,
  ) = __$$ListTicketsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Ticket> data, String? msg});
}

/// @nodoc
class __$$ListTicketsStateImplCopyWithImpl<$Res>
    extends _$ListTicketsStateCopyWithImpl<$Res, _$ListTicketsStateImpl>
    implements _$$ListTicketsStateImplCopyWith<$Res> {
  __$$ListTicketsStateImplCopyWithImpl(
    _$ListTicketsStateImpl _value,
    $Res Function(_$ListTicketsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? data = null,
    Object? msg = freezed,
  }) {
    return _then(
      _$ListTicketsStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            null == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<Ticket>,
        msg:
            freezed == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ListTicketsStateImpl
    with DiagnosticableTreeMixin
    implements _ListTicketsState {
  const _$ListTicketsStateImpl({
    this.isLoading = true,
    final List<Ticket> data = const [],
    this.msg,
  }) : _data = data;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Ticket> _data;
  @override
  @JsonKey()
  List<Ticket> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String? msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListTicketsState(isLoading: $isLoading, data: $data, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListTicketsState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTicketsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_data),
    msg,
  );

  /// Create a copy of ListTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTicketsStateImplCopyWith<_$ListTicketsStateImpl> get copyWith =>
      __$$ListTicketsStateImplCopyWithImpl<_$ListTicketsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ListTicketsState implements ListTicketsState {
  const factory _ListTicketsState({
    final bool isLoading,
    final List<Ticket> data,
    final String? msg,
  }) = _$ListTicketsStateImpl;

  @override
  bool get isLoading;
  @override
  List<Ticket> get data;
  @override
  String? get msg;

  /// Create a copy of ListTicketsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListTicketsStateImplCopyWith<_$ListTicketsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
