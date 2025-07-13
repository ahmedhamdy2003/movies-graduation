import 'package:flutter/material.dart';
import 'package:my_movie_app/core/resources/assets_manager.dart';
import 'package:my_movie_app/core/resources/colors_manager.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedAvatar = ImageAssets.avatar1;

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsManager.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        List<String> avatars = [
          ImageAssets.avatar1,
          ImageAssets.avatar2,
          ImageAssets.avatar3,
          ImageAssets.avatar4,
          ImageAssets.avatar5,
          ImageAssets.avatar6,
          ImageAssets.avatar7,
          ImageAssets.avatar8,
          ImageAssets.avatar9,
        ];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final isSelected = selectedAvatar == avatars[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = avatars[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? ColorsManager.yellow.withOpacity(0.2)
                        : Colors.transparent,
                    border: Border.all(
                      color: ColorsManager.yellow,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatars[index]),
                    radius: 30,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _updateProfile() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (phone.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number must be exactly 11 digits')),
      );
      return;
    }

    if (!phone.startsWith("010") && !phone.startsWith("011") &&
        !phone.startsWith("012") && !phone.startsWith("015")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number must start with 010, 011, 012, or 015')),
      );
      return;
    }

    print("Name: $name");
    print("Phone: $phone");
    print("Avatar: $selectedAvatar");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile Updated')),
    );

    Navigator.pop(context, {
      'name': name,
      'avatar': selectedAvatar,
    });
  }

  void _deleteAccount() {
    print("Account deleted");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Avatar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _showAvatarPicker,
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(color: ColorsManager.white),
                prefixIcon: const Icon(Icons.person, color: ColorsManager.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: ColorsManager.white),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(color: ColorsManager.white),
                prefixIcon: const Icon(Icons.phone, color: ColorsManager.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: ColorsManager.white),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  print("Reset password tapped");
                },
                child: const Text(
                  "Reset Password",
                  style: TextStyle(color: ColorsManager.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 75),
            Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _deleteAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.lightRed,
                    ),
                    child: const Text("Delete Account", style: TextStyle(color: ColorsManager.white)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _updateProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.yellow,
                    ),
                    child: const Text("Update Data"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
