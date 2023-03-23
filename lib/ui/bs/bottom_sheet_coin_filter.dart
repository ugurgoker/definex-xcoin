import 'package:flutter/material.dart';
import 'package:xcoin2/core/constants/constant_filter.dart';
import 'package:xcoin2/core/models/model_dropdown.dart';
import 'package:xcoin2/ui/widgets/widget_button.dart';
import 'package:xcoin2/ui/widgets/widget_dropdown.dart';
import 'package:xcoin2/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';
import '../base/base_view.dart';

class BottomSheetCoinFilter extends StatefulWidget {
  final ModelDropdown? selectedFilter;
  final Function(ModelDropdown?) onChangedFilter;
  
  const BottomSheetCoinFilter({super.key, this.selectedFilter, required this.onChangedFilter});

  @override
  State<BottomSheetCoinFilter> createState() => _BottomSheetCoinFilterState();
}

class _BottomSheetCoinFilterState extends State<BottomSheetCoinFilter> with BaseView {
  
  ModelDropdown? selectedFilter;
  List<ModelDropdown> filterList = ConstantFilter.getInstance().filterList;

  @override
  void initState() {
    selectedFilter = widget.selectedFilter;
    super.initState();
  }

  void setSelectedFilter(ModelDropdown value) {
    selectedFilter = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
            child: TextBasic(
              text: R.string.market,
              color: R.color.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          _getFilterList(context),
          Container(
            width: size(context).width,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
            child: ButtonBasic(
              onPressed: () {
                widget.onChangedFilter(selectedFilter);
                Navigator.pop(context);
              },
              text: 'Update Market',
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFilterList(BuildContext context) {
    return Column(
      children: List.generate(
        filterList.length,
        (index) => DropdownButtonBasic(
          item: filterList[index],
          isSelected: selectedFilter != null && selectedFilter!.id == filterList[index].id,
          isActiveBorder: index != filterList.length - 1,
          onSelected: setSelectedFilter,
        ),
      ),
    );
  }
}
