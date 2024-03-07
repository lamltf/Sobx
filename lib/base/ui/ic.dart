import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SvgIcon extends StatelessWidget {
//   const SvgIcon(
//       {Key? key,
//       required this.name,
//       this.width,
//       this.height,
//       this.color,
//       this.leftPadding})
//       : super(key: key);

//   final String name;
//   final double? width;
//   final double? height;
//   final Color? color;
//   final double? leftPadding;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: leftPadding ?? 0),
//       child: SvgPicture.asset('assets/icons/$name.svg',
//           package: 'mbpcomponents', width: width, height: height, color: color),
//     );
//   }
// }

// class SvgImage extends StatelessWidget {
//   const SvgImage(
//       {Key? key, required this.name, this.width, this.height, this.color})
//       : super(key: key);

//   final String name;
//   final double? width;
//   final double? height;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset('assets/icons/$name.svg',
//         package: 'mbpcomponents', width: width, height: height, color: color);
//   }
// }

class MbpImage extends StatelessWidget {
  const MbpImage(
      {Key? key, required this.name, this.width, this.height, this.fit})
      : super(key: key);

  final String name;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$name.png',
      // package: 'mbpcomponents',
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
