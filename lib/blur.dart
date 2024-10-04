import 'dart:ui';
import 'package:flutter/material.dart';
class AnimatedBlurScreen extends StatefulWidget {
  @override
  _AnimatedBlurScreenState createState() => _AnimatedBlurScreenState();
}
class _AnimatedBlurScreenState extends State<AnimatedBlurScreen> {
  double _sigmaX = 0.0;
  double _sigmaY = 0.0;

  void _toggleBlur() {
    setState(() {
      if (_sigmaX == 0.0 && _sigmaY == 0.0) {
        _sigmaX = 10.0;
        _sigmaY = 10.0;
      } else {
        _sigmaX = 0.0;
        _sigmaY = 0.0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Blur')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: _toggleBlur,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://i1.sndcdn.com/avatars-000602695431-2g0saa-t1080x1080.jpg',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _sigmaX > 0 ? 'Borrado!' : 'Clique para borrar!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
