import 'package:flutter/material.dart';
import 'package:paracels/themes/themes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ParaSizes.spacing16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ParaSizes.spacing8),
            child: Text(
              'Welcome, Dr. Veillerobe!',
              style: ParaTextStyles.headline1,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 400,
                  height: ParaSizes.inputHeight,
                  margin: const EdgeInsets.symmetric(horizontal: ParaSizes.spacing24),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: ParaColors.secondary,
                      ),
                      filled: true,
                      fillColor: ParaColors.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(ParaSizes.borderRadius),
                        borderSide: BorderSide(color: ParaColors.border),
                      ),
                      hintStyle: ParaTextStyles.hint2,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(ParaSizes.borderRadius),
                        borderSide: BorderSide(color: ParaColors.border),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: ParaSizes.spacing24),
                Icon(Icons.chat_bubble_outline_rounded, color: ParaColors.secondary),
                const SizedBox(width: ParaSizes.spacing8),
                Icon(Icons.notifications_none, color: ParaColors.secondary),
                const SizedBox(width: ParaSizes.spacing24),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: ParaSizes.spacing8),
                    Text('Dr. Veillerobe', style: ParaTextStyles.body2Bold),
                    const SizedBox(width: ParaSizes.spacing8),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ParaColors.primary,
                        size: ParaSizes.avatarSmall,
                      ),
                    ),
                    const SizedBox(width: ParaSizes.spacing8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
