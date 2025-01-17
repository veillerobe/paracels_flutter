// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      number: (json['number'] as num).toInt(),
      state: $enumDecodeNullable(_$RoomStateEnumMap, json['state']) ??
          RoomState.available,
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'state': _$RoomStateEnumMap[instance.state]!,
    };

const _$RoomStateEnumMap = {
  RoomState.available: 'available',
  RoomState.occupied: 'occupied',
  RoomState.reserved: 'reserved',
  RoomState.maintenance: 'maintenance',
};
