// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import '../database/database.dart';

class DatabaseTest extends StatefulWidget {
  const DatabaseTest({super.key});

  @override
  _DatabaseTestState createState() => _DatabaseTestState();
}

class _DatabaseTestState extends State<DatabaseTest> {
  final TextEditingController _textFieldController = TextEditingController();
  final database = AppDatabase();
  List<UserData> items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  void _fetchData() async {
    final databaseItems = await database.getUsers();
    setState(() => items = databaseItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User tokens')),
      body: _getItems(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  Widget _getItems() {
    return ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.token),
          );
        });
  }

  void _addTodoItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      database.saveItem(title);
      _fetchData();
    });
    _textFieldController.clear();
  }

  Future<AlertDialog?> _displayDialog(BuildContext context) async {
    return showDialog<AlertDialog?>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Voeg token toe'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Tekst hier'),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Toevoegen'),
                onPressed: () {
                  _addTodoItem(_textFieldController.text);
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: const Text('Annuleren'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
