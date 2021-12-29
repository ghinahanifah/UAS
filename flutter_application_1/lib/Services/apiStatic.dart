import 'package:flutter_application_1/Model/petani.dart';

class ApiStatic {
  static Future<List<Petani>> getPetani() async {
    List<Petani> petani = [];
    for (var i = 0; i < 10; i++) {
      petani.add(Petani(
          idPenjual: i,
          nama: "Petani" + i.toString(),
          nik: "123" + i.toString(),
          alamat: "Alamat",
          telp: "0876",
          foto: "assets/appimages/petani.png",
          createdAt: "",
          updateAt: ""));
    }
    return petani;
  }
}
