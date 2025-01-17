import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paracels/data/dummy_data.dart';
import 'package:paracels/models/room.dart';
import 'package:paracels/providers/floor_level_provider.dart';
import 'package:paracels/themes/para_colors.dart';
import 'package:paracels/themes/para_sizes.dart';
import 'package:paracels/themes/para_text_styles.dart';
import 'package:paracels/widgets/para_card.dart';
import 'package:paracels/widgets/para_dropdown_button.dart';

Map<FloorLevel, List<Room>> floors = DummyData.floors;

class HospitalActivityCard extends StatelessWidget {
  const HospitalActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: ParaSizes.spacing48,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hospital activity. Cardiology',
                style: ParaTextStyles.headline3,
              ),
              const FloorDropDownSelection(),
            ],
          ),
          Consumer(
            builder: (context, ref, _) {
              final floorLevelSelected = ref.watch(selectedFloorLevelProvider);
              return SizedBox(
                height: ParaSizes.mapSize,
                child: GridView.count(
                  crossAxisCount: 11,
                  children: [
                    ...DummyData.floors[floorLevelSelected]!.sublist(0, 11).map(
                          (e) => RoomCase(room: e),
                        ),
                    MapBox(
                      child: Center(
                        child: Text(
                          'Exit',
                          style: ParaTextStyles.body2,
                        ),
                      ),
                    ),
                    ...List.generate(
                      9,
                      (_) => MapBox(
                        borderColor: ParaColors.background,
                      ),
                    ),
                    MapBox(
                      child: Center(
                        child: Text(
                          'MC',
                          style: ParaTextStyles.body2,
                        ),
                      ),
                    ),
                    ...DummyData.floors[floorLevelSelected]!.sublist(11).map(
                          (e) => RoomCase(room: e),
                        ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoomCase extends StatelessWidget {
  const RoomCase({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    Color getBorderColor() {
      switch (room.state) {
        case RoomState.occupied:
        case RoomState.maintenance:
          return ParaColors.border;
        case RoomState.reserved:
          return HexColor('#9acfe8');
        case RoomState.available:
          return HexColor('#9ae8ba');
      }
    }

    Color getContainerColor() {
      final borderColor = getBorderColor();
      return borderColor.withValues(alpha: 0.2);
    }

    TextStyle getTextStyle() {
      switch (room.state) {
        case RoomState.maintenance:
          return ParaTextStyles.body1.copyWith(color: getBorderColor());
        case RoomState.occupied:
        case RoomState.reserved:
        case RoomState.available:
          return ParaTextStyles.body1;
      }
    }

    return MapBox(
      borderColor: getBorderColor(),
      containerColor: getContainerColor(),
      child: Center(
        child: Text(
          room.number.toString(),
          style: getTextStyle(),
        ),
      ),
    );
  }
}

class MapBox extends StatelessWidget {
  const MapBox({
    this.borderColor,
    this.containerColor,
    this.child,
    super.key,
  });

  final Color? borderColor;
  final Color? containerColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? ParaColors.border),
        color: containerColor,
      ),
      child: child,
    );
  }
}

class FloorDropDownSelection extends ConsumerWidget {
  const FloorDropDownSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ParaDropDownButton<FloorLevel>(
      selectedValue: ref.watch(selectedFloorLevelProvider),
      items: FloorLevel.values,
      onChanged: (value) {
        if (value != null) {
          ref.read(selectedFloorLevelProvider.notifier).state = value;
        }
      },
      textBuilder: (floorLevel) => floorLevel.label,
    );
  }
}

extension FloorLevelExt on FloorLevel {
  String get label {
    switch (this) {
      case FloorLevel.level1:
        return '1st Floor';
      case FloorLevel.level2:
        return '2nd Floor';
      case FloorLevel.level3:
        return '3rd Floor';
    }
  }
}
