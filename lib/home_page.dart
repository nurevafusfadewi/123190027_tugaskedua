import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {

  final String username;

  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _namaLengkap = "";
  String _email = "";
  String _nomorHandphone = "";
  String _alamatRumah = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24),
            child: Center(
                child: Column(
                  children: [
                    _image(),
                    SizedBox(height: 12),
                    Text(
                      "Hello ${widget.username}\nWelcome to the biodata",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 24),
                    Text("Input Biodata"),
                    SizedBox(height: 12),
                    _buildForm(),
                    SizedBox(height: 24),
                    _buildButtonSubmit(),

                  ],
                )
            ),
        ),
      ),
    );
  }

  Widget _image(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: 300.0,
        child: Image.asset('images/emonn.jpg')
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1}){
    return Container(
      width: 500.0,
      child: TextFormField(
        enabled: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          contentPadding: const EdgeInsets.all(12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        onChanged: setStateInput,
      ),
    );
  }

  Widget _buildForm(){
    return Column(
      children: [
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nama Lengkap",
          label: "Nama *",
          setStateInput: (value) {
              _namaLengkap = value;
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Email",
          label: "Email *",
          setStateInput: (value) {
              _email = value;
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Nomor HP Aktif",
          label: "Nomor HP *",
          setStateInput: (value) {
              _nomorHandphone = value;
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat Rumah",
          label: "Alamat",
          setStateInput: (value) {
              _alamatRumah = value;
          },
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildButtonSubmit(){
    return Container(
        child: ElevatedButton(
          onPressed: () {
            if (_namaLengkap == "" || _email == "" ||
                _nomorHandphone == "") {
              SnackBar snackBar = SnackBar(
                content: Text("* data tidak boleh kosong"),
              );
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBar);
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) {
                    return ProfilePage(
                      nama: _namaLengkap,
                      username: widget.username,
                      email: _email,
                      nomor: _nomorHandphone,
                      alamat: _alamatRumah,
                    );
                  }));
            }
          },
          child: Text('Submit'),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16),
              textStyle: TextStyle(fontSize: 16)),
        ),
    );
  }
}
