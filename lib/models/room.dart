import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int number,
    @Default(RoomState.available) RoomState state,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

enum RoomState {
  available,
  occupied,
  reserved,
  maintenance,
}

enum FloorLevel {
  level1,
  level2,
  level3,
}
