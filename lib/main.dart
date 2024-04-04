import 'package:cakelaya/avatar_selector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailIDController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();

  bool _isEditing = false;
  String _editingText = '';

  String _avatarUrl =
      'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png';

  void setAvatarUrl(String newAvatarUrl) {
    setState(() {
      _avatarUrl = newAvatarUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'YOUR PROFILE',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(_avatarUrl),
                      radius: 75,
                    ),
                    Positioned(
                      right: -3,
                      bottom: -3,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectAvatar(
                                        onAvatarSelected: (newAvatarUrl) {
                                          setState(() {
                                            _avatarUrl = newAvatarUrl;
                                          });
                                        },
                                      )));
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _editableContainer(
                      title: 'Name',
                      initialText: 'Asif',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    _editableContainer(
                      title: 'Phonenumber',
                      initialText: '7559913631',
                      controller: _phoneNumberController,
                    ),
                    const SizedBox(height: 16),
                    _editableContainer(
                      title: 'Email ID',
                      initialText: 'moh.asif@protonmail.ch',
                      controller: _emailIDController,
                    ),
                    const SizedBox(height: 16),
                    _editableContainer(
                      title: 'Date of Birth',
                      initialText: '30/11/2001',
                      controller: _dobController,
                    ),
                    const SizedBox(height: 16),
                    _editableContainer(
                      title: 'Gender',
                      initialText: 'Male',
                      controller: _genderController,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _editableContainer({
    required String title,
    required String initialText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                  _editingText = title;
                  controller.text = initialText;
                });
              },
              icon: const Icon(Icons.edit),
            ),
            if (_isEditing && _editingText == title)
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _isEditing = false;
                      initialText = value; // Update the initialText here
                    });
                  },
                ),
              ),
            if (_isEditing && _editingText == title)
              IconButton(
                onPressed: () {
                  setState(() {
                    _isEditing = false;
                  });
                },
                icon: const Icon(Icons.check),
              ),
          ],
        ),
      ),
    );
  }
}
