import 'package:paracels/models/room.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floor_level_provider.g.dart';

// int floorLevel(Ref ref) {
//   return 3;
// }

/// Annotating a class by `@riverpod` defines a new shared state for your application,
/// accessible using the generated [selectedFloorLevelProvider].
/// This class is both responsible for initializing the state (through the [build] method)
/// and exposing ways to modify it (cf [update]).
@riverpod
class SelectedFloorLevel extends _$SelectedFloorLevel {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  FloorLevel build() => FloorLevel.level3;

  @override
  set state(FloorLevel newState) => super.state = newState;
  FloorLevel update(FloorLevel Function(FloorLevel state) cb) => state = cb(state);
}
