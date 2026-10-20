// File tạo có chủ đích để minh họa:
// 1. CƠ CHẾ 5 (custom_script): Tên file không có hậu tố _view.dart (profile_demo_page.dart)
// 2. CƠ CHẾ 2 (forbidden_calls): Gọi print() trực tiếp trên production
// 3. CƠ CHẾ 4 (meta_pattern): Bắt khối catch ($E) {} rỗng nuốt lỗi
// 4. CƠ CHẾ 3 (ast_pattern): Gọi setState() sau await mà thiếu if (!mounted)

import 'package:flutter/material.dart';

class ProfileDemoPage extends StatefulWidget {
  const ProfileDemoPage({Key? key}) : super(key: key);

  @override
  State<ProfileDemoPage> createState() => _ProfileDemoPageState();
}

class _ProfileDemoPageState extends State<ProfileDemoPage> {
  String status = "idle";

  Future<void> submitData() async {
    // VI PHẠM CƠ CHẾ 2 (forbidden_calls):
    print("User submitted matrix access token: secret_token_xyz");

    // VI PHẠM CƠ CHẾ 4 (meta_pattern): Khối catch rỗng nuốt lỗi
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
    }

    // VI PHẠM CƠ CHẾ 3 (ast_pattern): Thiếu if (!mounted) return; sau await
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      status = "completed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Showcase Demo Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: submitData,
          child: Text(status),
        ),
      ),
    );
  }
}
