import 'package:api_dio/album.dart';
import 'package:flutter/material.dart';

class EditAlbumScreen extends StatefulWidget {
  final Album album;

  const EditAlbumScreen({Key? key, required this.album}) : super(key: key);

  @override
  _EditAlbumScreenState createState() => _EditAlbumScreenState();
}

class _EditAlbumScreenState extends State<EditAlbumScreen> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.album.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _updateAlbum() async {
    try {
      await updateAlbum(widget.album.id, _titleController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Album updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update album')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _updateAlbum,
              child: const Text('Update Album'),
            ),
          ],
        ),
      ),
    );
  }
}
