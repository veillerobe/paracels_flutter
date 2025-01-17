import 'package:paracels/models/room.dart';

//In a true app, this would be in a repository to access to backend in all initState with fetch commands

class DummyData {
  static final workDays = [
    DateTime(2023, 6, 28),
    DateTime(2023, 7, 9),
    DateTime(2023, 7, 12),
    DateTime(2023, 7, 22),
    DateTime(2023, 7, 24),
  ];

  static final sickLeaveDays = [
    DateTime(2023, 7, 10),
    DateTime(2023, 7, 14),
  ];

  static final vocationDays = [
    DateTime(2023, 7, 11),
    DateTime(2023, 7, 16),
    DateTime(2023, 7, 20),
  ];

  static final Map<FloorLevel, List<Room>> floors = {
    FloorLevel.level1: [
      const Room(number: 1, state: RoomState.maintenance),
      const Room(number: 2),
      const Room(number: 3, state: RoomState.maintenance),
      const Room(number: 4, state: RoomState.reserved),
      const Room(number: 5),
      const Room(number: 6, state: RoomState.maintenance),
      const Room(number: 7, state: RoomState.reserved),
      const Room(number: 8, state: RoomState.occupied),
      const Room(number: 9),
      const Room(number: 10, state: RoomState.occupied),
      const Room(number: 11, state: RoomState.maintenance),
      const Room(number: 12, state: RoomState.reserved),
      const Room(number: 13, state: RoomState.occupied),
      const Room(number: 14, state: RoomState.maintenance),
      const Room(number: 15),
      const Room(number: 16, state: RoomState.reserved),
      const Room(number: 17, state: RoomState.maintenance),
      const Room(number: 18, state: RoomState.occupied),
      const Room(number: 19),
      const Room(number: 20, state: RoomState.reserved),
      const Room(number: 21, state: RoomState.maintenance),
      const Room(number: 22),
    ],
    FloorLevel.level2: [
      const Room(number: 1, state: RoomState.occupied),
      const Room(number: 2, state: RoomState.reserved),
      const Room(number: 3, state: RoomState.occupied),
      const Room(number: 4),
      const Room(number: 5, state: RoomState.occupied),
      const Room(number: 6, state: RoomState.maintenance),
      const Room(number: 7, state: RoomState.occupied),
      const Room(number: 8, state: RoomState.maintenance),
      const Room(number: 9, state: RoomState.occupied),
      const Room(number: 10),
      const Room(number: 11),
      const Room(number: 12),
      const Room(number: 13, state: RoomState.maintenance),
      const Room(number: 14),
      const Room(number: 15, state: RoomState.maintenance),
      const Room(number: 16, state: RoomState.occupied),
      const Room(number: 17),
      const Room(number: 18, state: RoomState.occupied),
      const Room(number: 19),
      const Room(number: 20),
      const Room(number: 21),
      const Room(number: 22, state: RoomState.occupied),
    ],
    FloorLevel.level3: [
      const Room(number: 1, state: RoomState.occupied),
      const Room(number: 2, state: RoomState.occupied),
      const Room(number: 3, state: RoomState.reserved),
      const Room(number: 4, state: RoomState.occupied),
      const Room(number: 5, state: RoomState.occupied),
      const Room(number: 6, state: RoomState.occupied),
      const Room(number: 7, state: RoomState.occupied),
      const Room(number: 8, state: RoomState.maintenance),
      const Room(number: 9, state: RoomState.maintenance),
      const Room(number: 10, state: RoomState.maintenance),
      const Room(number: 11, state: RoomState.occupied),
      const Room(number: 12, state: RoomState.occupied),
      const Room(number: 13),
      const Room(number: 14),
      const Room(number: 15),
      const Room(number: 16, state: RoomState.occupied),
      const Room(number: 17, state: RoomState.occupied),
      const Room(number: 18),
      const Room(number: 19),
      const Room(number: 20, state: RoomState.reserved),
      const Room(number: 21, state: RoomState.maintenance),
      const Room(number: 22, state: RoomState.occupied),
    ],
  }; // dummy data
}
