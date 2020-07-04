import 'package:flutter/material.dart';
import 'package:nike/shoe.dart';
import 'dart:math' as math;
import 'mRec.dart';

class BoxWidget extends StatelessWidget {
  Shoe shoe;
  double pagerValue;

  BoxWidget({this.shoe, this.pagerValue});

  Tween<double> animation = Tween<double>(begin: .35, end: 1);
  Tween<double> animationRo = Tween<double>(begin: .7, end: 1.5);
  double animationValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        buildContainerBox(size),
        Positioned(
          top: 250 + 45.0,
          left: size.width/2-100,
          child: Image.asset(
            shoe.image,
            width: 200,
            height: 110,
          ),
        ),
        Positioned(
          top: 240,
          left: size.width/2-100,
          child: RotatedBox(
            quarterTurns: 2,
            child: Image.asset(
              shoe.image,
              width: 200,
              height: 110,
            ),
          ),
        ),
        buildBoxDoor(size),
        buildBoxDoorTop(size)
      ],
    );
  }

  Container buildContainerBox(Size size) {
    return Container(
      child: CustomPaint(
        painter: MRec(),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }

  Widget buildBoxDoor(Size size) {
    animationValue = (shoe.index - pagerValue).abs();
    return Positioned(
      top: 19,
      left: size.width / 2 - 232 / 2,
      child: Transform(
        origin: Offset(0, 100),
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, .001)
          ..rotateX(math.pi * animation.transform(animationValue))
          ..scale(.9 + .1 * (1 - animationValue), 1.0),
        child: Center(
          child: Container(
            width: 232,
            height: 200,
            color: animation.transform(animationValue) < .5
                ? Colors.orange[200]
                : Colors.orange,
            child: animation.transform(animationValue) < .5
                ? Container()
                : Center(
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, 100.0)
                        ..rotateX(math.pi * 3),
                      child: Image.asset(
                        'images/nike.png',
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildBoxDoorTop(Size size) {
    return Positioned(
      top: 50,
      left: size.width / 2 - 285 / 2,
      child: Transform(
        alignment: FractionalOffset.bottomCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, .0008)
          ..translate(0.0, 380 * animationValue)
          ..scale(
              .9 + .1 * (1 - animationValue), .9 + .1 * (1 - animationValue))
          ..rotateX(math.pi * animationRo.transform(animationValue)),
        child: Center(
          child: Container(
            width: 285,
            height: 60,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
