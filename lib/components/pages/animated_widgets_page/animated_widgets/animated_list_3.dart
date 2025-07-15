import 'package:flutter/material.dart';

class AnimatedList3 extends StatefulWidget {
  const AnimatedList3({super.key});

  @override
  State<AnimatedList3> createState() => _AnimatedList3State();
}

class _AnimatedList3State extends State<AnimatedList3> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  int _nextItem = 4;

  void _addItem() {
    final index = _items.length;
    _items.add('Item $_nextItem');
    _nextItem++;
    _listKey.currentState!.insertItem(
      index,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _removeItem(int index) {
    final removedItem = _items.removeAt(index);
    _listKey.currentState?.removeItem(index, (context, animation) {
      return SlideTransition(
        position: animation.drive(Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        )),  
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.red.shade100,
          child: ListTile(
            title: Text(removedItem),
            trailing: const Icon(Icons.delete),
          ),
        ),
      );
    });
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
       position: animation.drive(Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        )),  
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: Colors.blue.shade100,
        child: ListTile(
          title: Text(item),
          trailing: const Icon(Icons.delete),
          onTap: () {
            final index = _items.indexOf(item);
            if (index != -1) {
              _removeItem(index);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List 3'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is the Animated List 1 widget'),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.6,
                child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(_items[index], animation);
                },
              ),),
            
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}