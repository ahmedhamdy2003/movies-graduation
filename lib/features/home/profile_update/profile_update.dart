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

  // المتغير اللي هيحتفظ بالأفاتار المختار
  String selectedAvatar = ImageAssets.avatar1;

  // فتح البوتوم شيت لاختيار الأفاتار
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
                  Navigator.pop(context); // اقفل البوتوم شيت
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
            // صورة الأفاتار القابلة للضغط
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
                onPressed: () {},
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
                    onPressed: () {
                      print("Delete Account");
                    },
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
                    onPressed: () {
                      print("Update Data");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.yellow,
                    ),
                    child: const Text(" Update Data"),
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
