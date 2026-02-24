import 'package:flutter/material.dart';
import 'package:todo_list/text_styles.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget – stateless because it doesn't store any changing state.
/// All the interesting state lives in [TodoListPage].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // build() in StatelessWidget is called:
    // - when the widget is first inserted into the tree
    // - when its parent rebuilds and provides new configuration
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.purpleAccent,
        fontFamily: 'Mali',
      ),
      home: const TodoListPage(),
    );
  }
}

/// StatefulWidget – the page has internal state (list of tasks).
/// This class itself is immutable.
/// The mutable state lives inside the associated State object.
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() {
    // createState() is called once when the widget is inserted
    // into the widget tree.
    // It creates the mutable State object.
    return _TodoListPageState();
  }
}

/// The State class contains:
/// - mutable variables
/// - lifecycle methods
/// - UI logic
/// - setState() calls
class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    // Called once when the widget is inserted in the tree.
    // (when the State object is created, before the first build())
    debugPrint('TodoListPage – initState');
  }

  /// Adds a new task using the current value of the TextField.
  void _addTask() {}

  /// Toggles the "done" flag of a task.
  void _toggleTaskDone(int index, bool? value) {}

  /// Removes a task from the list.
  void _removeTask(int index) {}

  @override
  Widget build(BuildContext context) {
    // build() is called:
    // - after initState()
    // - after every setState()
    // - when parent widget rebuilds
    // - when MediaQuery / Theme changes
    //
    // IMPORTANT:
    // build() must be fast and pure.
    // Avoid heavy logic or API calls here.
    debugPrint('TodoListPage – build() called.');

    return Scaffold(
      extendBodyBehindAppBar: true, // To make AppBar transparent over bg image.
      appBar: AppBar(
        title: const Text('To-Do List', style: AppTextStyles.h1),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Input area: TextField + Add button.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  spacing: 8,
                  children: [
                    // TODO: add TextField and Add button.
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Colors.blueGrey),
              // Tasks list.
              // TODO: show list of tasks or empty widget.
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // dispose() is called ONCE:
    // - when the widget is permanently removed
    // from the widget tree.
    //
    // Always:
    // - dispose TextEditingController
    // - dispose AnimationController
    // - clean resources
    //
    // Prevents memory leaks.
    debugPrint('TodoListPage – dispose');
    super.dispose();
  }
}

/// Shown when there are no tasks.
/// Stateless because it has no internal state.
class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No tasks yet.\nAdd your first one!',
        style: AppTextStyles.body400BlueGray,
        textAlign: TextAlign.center,
      ),
    );
  }
}
