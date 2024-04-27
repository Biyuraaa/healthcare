import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String namaProfil = "Kipli";
  String emailProfil = "raflimustari2@gmail.com";
  String telepon = "081336539269";
  ImageProvider? fotoProfil =
      AssetImage("images/profil.jpg"); // Ganti dengan foto profil yang sesuai

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Profil'),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  _editFotoProfil(context);
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: fotoProfil,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.account_circle),
                subtitle: Text("nama"),
                title: Text(namaProfil, style: TextStyle(fontSize: 18)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editData(context, "nama");
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                subtitle: Text("email"),
                title: Text(emailProfil, style: TextStyle(fontSize: 18)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editData(context, "email");
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.call),
                subtitle: Text("Telepon"),
                title: Text(telepon, style: TextStyle(fontSize: 18)),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editData(context, "telepon");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editData(BuildContext context, String field) {
    TextEditingController _controller = TextEditingController();
    String labelText = field == "nama"
        ? "Masukkan nama baru"
        : field == "email"
            ? "Masukkan email baru"
            : "Masukkan telepon baru";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: labelText),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (field == "nama") {
                    namaProfil = _controller.text;
                  } else if (field == "email") {
                    emailProfil = _controller.text;
                  } else if (field == "telepon") {
                    telepon = _controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _editFotoProfil(BuildContext context) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      setState(() {
        fotoProfil = FileImage(File(photo.path));
      });
    }
  }
}
