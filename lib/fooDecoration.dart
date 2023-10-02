import 'package:flutter/material.dart';

class FooDecoration extends Decoration {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;
  final BorderRadius borderRadius;

  const FooDecoration({
    this.insets = const EdgeInsets.all(1),
    this.color = const Color(0xFF6F665A),
    this.blurRadius = 20,
    this.inner = false,
    this.borderRadius = BorderRadius.zero,
  });
  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) =>
      _FooBoxPainter(insets, color, blurRadius, inner, borderRadius);
}

class _FooBoxPainter extends BoxPainter {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;
  final BorderRadius borderRadius;

  _FooBoxPainter(
      this.insets, this.color, this.blurRadius, this.inner, this.borderRadius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var rect = offset & configuration.size!;
    Radius rad = const Radius.circular(5);
    Offset shadowOffset = const Offset(0, 5);
    // canvas.clipRect(rect);
    canvas.clipRRect(RRect.fromRectAndRadius(rect, rad));
    var paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, blurRadius);

    var path = Path();
    if (inner) {
      path
        ..fillType = PathFillType.evenOdd
        ..addRect(insets.inflateRect(rect))
        ..addRect(rect);
    } else {
      path.addRect(insets.deflateRect(rect));
    }
    canvas.drawPath(path, paint);
  }
}

// class _FooBoxPainter extends BoxPainter {
//   final EdgeInsets insets;
//   final Color color;
//   final double blurRadius;
//   final bool inner;
//   final BorderRadius borderRadius;

//   _FooBoxPainter(
//       this.insets, this.color, this.blurRadius, this.inner, this.borderRadius);

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     var rect = offset & configuration.size!;

//     // Apply the border radius to both the box and the shadow
//     Radius rad = const Radius.circular(5);

//     // Offset the shadow by 5 pixels down
//     Offset shadowOffset = const Offset(0, 5);

//     // Define a rect for the shadow
//     var shadowRect = rect.shift(shadowOffset);

//     // Define a rect for the box
//     var boxRect = insets.deflateRect(rect);

//     var paint = Paint()..color = color;

//     // Draw the shadow with a gradient mask filter to make it fade
//     if (inner) {
//       paint.maskFilter = MaskFilter.blur(BlurStyle.inner, blurRadius);
//       canvas.drawRRect(
//           RRect.fromRectAndRadius(shadowRect, rad),
//           paint
//             ..shader = LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [color.withOpacity(0.0), color],
//             ).createShader(shadowRect));
//     } else {
//       paint.maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);
//       canvas.drawRRect(
//           RRect.fromRectAndRadius(shadowRect, rad),
//           paint
//             ..shader = LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [color, color.withOpacity(0.0)],
//             ).createShader(shadowRect));
//     }

//     // Draw the box with the same border radius
//     paint
//       ..maskFilter = null
//       ..style = PaintingStyle.fill;
//     canvas.drawRRect(RRect.fromRectAndRadius(boxRect, rad), paint);
//   }
// }
