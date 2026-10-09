import 'package:flutter/material.dart';
import 'section_header_widget.dart';
import 'selectable_chip.dart';
import '../list_items/section_header_list_item.dart';

class ChipSelector extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;
  final double chipPadding;

  const ChipSelector({
    super.key,
    required this.title,
    required this.options,
    required this.selected,
    required this.onSelected,
    this.chipPadding = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(item: SectionHeaderListItem(title: title)),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: options
              .map(
                (option) => SelectableChip(
                  label: option,
                  isSelected: option == selected,
                  horizontalPadding: chipPadding,
                  onTap: () => onSelected(option),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

