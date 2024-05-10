import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomContainer extends StatefulWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  EdgeInsets? padding;
  final BoxDecoration ?decoration;
  final VoidCallback ontap;
  final Image? image;

  CustomContainer({this.child, this.width, this.height, this.color, this.decoration,this.padding,this.image,required this.ontap});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        decoration: widget.decoration,
        child: widget.child,
      ),
    );
  }
}

