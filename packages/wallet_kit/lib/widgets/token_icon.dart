import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_kit/wallet_kit.dart';

class TokenIcon extends StatelessWidget {
  final TokenSymbol symbol;

  final double size;

  const TokenIcon({super.key, required this.symbol, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "packages/wallet_kit/assets/images/crypto/${symbol.name}.svg",
      width: 24,
      height: 24,
    );
  }
}
