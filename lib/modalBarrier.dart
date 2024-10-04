import 'package:flutter/material.dart';

class AnimatedModalBarrierScreen extends StatefulWidget {
  @override
  _AnimatedModalBarrierScreenState createState() => _AnimatedModalBarrierScreenState();
}

class _AnimatedModalBarrierScreenState extends State<AnimatedModalBarrierScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isModalVisible = false;
  TextEditingController _textController = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose(); 
    super.dispose();
  }

  void _toggleModalBarrier() {
    setState(() {
      _isModalVisible = !_isModalVisible;
      _isModalVisible ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Modal Barrier')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, const Color.fromARGB(255, 238, 141, 255)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Digite aqui:',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: !_isModalVisible,
                ),
              ),

              ElevatedButton(
                onPressed: _toggleModalBarrier,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.purpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Ativar Modal Barrier',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
