import 'package:flutter/material.dart';
import 'package:xcoin2/core/models/model_base_dropdown.dart';

import '../../core/resources/_r.dart';
import 'widgets_text.dart';

class DropdownButtonBasic<T extends BaseDropdown> extends StatelessWidget {
  final T item;
  final bool isSelected;
  final bool isActiveBorder;
  final Function(T) onSelected;
  const DropdownButtonBasic({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isActiveBorder,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 26.0),
        decoration: BoxDecoration(
          border: isActiveBorder ? Border(bottom: BorderSide(width: 1.0, color: R.color.gray.shade200)) : null,
          color: R.color.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextBasic(
                text: item.dropdownTitle,
                color: R.color.gray.shade900,
                fontFamily: R.fonts.robotoMedium,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12.0),
            Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.0, color: isSelected ? R.color.primary : R.color.gray.shade300),
              ),
              child: Center(
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    color: isSelected ? R.color.primary : R.color.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
