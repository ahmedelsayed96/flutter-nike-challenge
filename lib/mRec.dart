import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MRec extends CustomPainter {
  double startFromX, endToX;

  @override
  void paint(Canvas canvas, Size size) {
    startFromX = size.width / 2 - 100;
    endToX = startFromX + 200;

    drawCenterRect(canvas);
    drawRightSide(canvas);
    drawLeftSide(canvas);
    drawTopSide(canvas);
    drawBottomSide(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void drawCenterRect(Canvas canvas) {
    Shader linearGrient = LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Colors.grey,
          Colors.orange[200]
        ]).createShader(
        Rect.fromCenter(center: Offset(endToX, 400), height: 500, width: 1));
    Path path = Path();
    path.moveTo(startFromX, 250);
    path.lineTo(startFromX, 400);
    path.lineTo(endToX, 400);
    path.lineTo(endToX, 250);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange[200]
          ..shader = linearGrient);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  void drawRightSide(Canvas canvas) {
    Shader linearGrient = LinearGradient(colors: [
      Colors.grey,
      Colors.orange[200]
    ]).createShader(
        Rect.fromCenter(center: Offset(endToX, 400), height: 30, width: 20));
    Path path = Path();
    path.moveTo(endToX, 400);
    path.lineTo(endToX + 15, 400);
    path.lineTo(endToX + 15, 220);
    path.lineTo(endToX, 250);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange[200]
          ..shader = linearGrient);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  void drawLeftSide(Canvas canvas) {
    Shader linearGrient = LinearGradient(
            end: Alignment.centerLeft,
            begin: Alignment.centerRight,
            colors: [Colors.grey, Colors.orange[200]])
        .createShader(Rect.fromCenter(
            center: Offset(startFromX, 220), height: 20, width: 30));
    Path path = Path();
    path.moveTo(startFromX - 15, 220);
    path.lineTo(startFromX - 15, 400);
    path.lineTo(startFromX, 400);
    path.lineTo(startFromX, 220);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange[200]
          ..shader = linearGrient);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  void drawTopSide(Canvas canvas) {
    Shader linearGrient = LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Colors.grey,
          Colors.orange[200]
        ]).createShader(
        Rect.fromCenter(center: Offset(endToX, 250), height: 30, width: 30));
    Path path = Path();
    path.moveTo(endToX + 15, 220);
    path.lineTo(startFromX - 15, 220);
    path.lineTo(startFromX, 250);
    path.lineTo(endToX, 250);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange[200]
          ..shader = linearGrient);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }

  void drawBottomSide(Canvas canvas) {
    Path path = Path();
    path.moveTo(startFromX - 15, 400);
    path.lineTo(startFromX, 410);
    path.lineTo(endToX, 410);
    path.lineTo(endToX + 15, 400);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.orange);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);
  }
}
