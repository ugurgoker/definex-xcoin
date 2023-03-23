import 'package:flutter/material.dart';
import 'package:xcoin2/core/extensions/extension_string.dart';
import 'package:xcoin2/core/models/model_coin.dart';
import 'package:xcoin2/ui/widgets/widget_image.dart';
import 'package:xcoin2/ui/widgets/widgets_text.dart';

import '../../core/resources/_r.dart';
import '../../core/utils/general_data.dart';

class CoinItem extends StatelessWidget {
  final ModelCoin item;
  const CoinItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            NetworkImageWithPlaceholder(
              size: 40.0,
              imageUrl: item.imageUrl,
              isCircle: true,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBasic(
                    text: item.longName,
                    color: R.color.titleColor,
                    fontFamily: R.fonts.robotoItalic,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w100,
                  ),
                  TextBasic(
                    text: item.shortName,
                    color: R.color.gray,
                    fontFamily: R.fonts.robotoItalic,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w100,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextBasic(
                  text: '${item.currency.getCurrencySymbol()}${GeneralData.currencyFormat.format(item.currentPrice)}',
                  color: R.color.titleColor,
                  fontFamily: R.fonts.robotoItalic,
                  fontSize: 16.0,
                ),
                const SizedBox(height: 4.0),
                TextBasic(
                  text: '${item.changeRatio.toStringAsFixed(2)}%',
                  color: item.changeRatio.isNegative ? R.color.radicalRed : R.color.green,
                  fontSize: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
