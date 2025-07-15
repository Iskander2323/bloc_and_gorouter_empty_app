import 'package:flutter/material.dart';

class AnimatedGridExample extends StatefulWidget {
  const AnimatedGridExample({super.key});
  @override
  State<AnimatedGridExample> createState() => _AnimatedGridExampleState();
}

class _AnimatedGridExampleState extends State<AnimatedGridExample> {
   List<int> _items = [];
  int _nextItem = 0;

  void _addItem() {
    setState(() {
      _items.add(_nextItem++);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid: жаңа элемент анимациямен")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _items.length,
        gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return _AnimatedGridItem(
            key: ValueKey(_items[index]),
            value: _items[index],
            onTap: () => _removeItem(index),
          );
        },
      ),
    );
  }
}

/// Анимациямен шығатын Grid элемент
class _AnimatedGridItem extends StatefulWidget {
  final int value;
  final VoidCallback onTap;

  const _AnimatedGridItem({
    required Key key,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_AnimatedGridItem> createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<_AnimatedGridItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward(); // элемент көріне салысымен анимация басталады
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '${widget.value}',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}