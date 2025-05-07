import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Membuang Sampah Organik', 'completed': false},
    {'title': 'Daur Ulang Botol Plastik', 'completed': false},
    {'title': 'Kompos Daun Kering', 'completed': false},
    {'title': 'Pilah Sampah Anorganik', 'completed': false},
  ];
  int points = 0;

  late AnimationController _animationController;
  late Animation<int> _pointsAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _pointsAnimation = IntTween(
      begin: points,
      end: points,
    ).animate(_animationController);
  }

  void completeTask(int index) {
    if (tasks[index]['completed']) return;
    setState(() {
      tasks[index]['completed'] = true;
      points += 10;
      _animatePoints(points - 10, points);
    });
  }

  void _animatePoints(int from, int to) {
    _pointsAnimation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {});
    });
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildTaskItem(int index) {
    final task = tasks[index];
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: task['completed'] ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:
                task['completed']
                    ? Colors.green.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder:
              (widget, anim) => ScaleTransition(scale: anim, child: widget),
          child:
              task['completed']
                  ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    key: ValueKey('done$index'),
                  )
                  : Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    key: ValueKey('open$index'),
                  ),
        ),
        title: Text(
          task['title'],
          style: TextStyle(
            fontSize: 18,
            decoration: task['completed'] ? TextDecoration.lineThrough : null,
            color: task['completed'] ? Colors.grey[600] : Colors.black,
          ),
        ),
        onTap: () => completeTask(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Misi Harian'), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: Text(
              'Poin Anda: ${_pointsAnimation.value}',
              key: ValueKey(_pointsAnimation.value),
              style: TextStyle(
                fontSize: 28,
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => _buildTaskItem(index),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Klik tugas untuk menyelesaikan dan mendapatkan poin.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
