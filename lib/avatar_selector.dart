import 'package:flutter/material.dart';

typedef AvatarSelectedCallback = void Function(String avatarUrl);

class SelectAvatar extends StatefulWidget {
  final AvatarSelectedCallback onAvatarSelected;

  const SelectAvatar({Key? key, required this.onAvatarSelected})
      : super(key: key);

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('Select Avatar')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildAvatar(
              url:
                  'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png',
              onTap: () {
                widget.onAvatarSelected(
                    'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png');
                Navigator.pop(context);
              },
            ),
            _buildAvatar(
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuCf31SSHaH1Z8oPndTOFf1FctAz3_1GSQCe_7AA4wsDvpxNp2xh3pck7M5HGHj97zG8g&usqp=CAU',
              onTap: () {
                widget.onAvatarSelected(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuCf31SSHaH1Z8oPndTOFf1FctAz3_1GSQCe_7AA4wsDvpxNp2xh3pck7M5HGHj97zG8g&usqp=CAU');
                Navigator.pop(context);
              },
            ),
            _buildAvatar(
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEhVw9dcAQoNFKKtrf7D_LYNDNqUnB7q8pLG4HRk9e8x5mMKf40ldaANlU24Bc6qY2iFY&usqp=CAU',
              onTap: () {
                widget.onAvatarSelected(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEhVw9dcAQoNFKKtrf7D_LYNDNqUnB7q8pLG4HRk9e8x5mMKf40ldaANlU24Bc6qY2iFY&usqp=CAU');
                Navigator.pop(context);
              },
            ),
            _buildAvatar(
              url:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JKYEvZgMEnetKcXxqSYVhYk7UCkUZC4HXRT9WP7ebg&s',
              onTap: () {
                widget.onAvatarSelected(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JKYEvZgMEnetKcXxqSYVhYk7UCkUZC4HXRT9WP7ebg&s');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar({required String url, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
          radius: 30,
        ),
      ),
    );
  }
}
