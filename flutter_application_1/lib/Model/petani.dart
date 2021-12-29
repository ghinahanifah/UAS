class Petani {
  Petani({
    required this.idPenjual,
    required this.nama,
    required this.nik,
    required this.alamat,
    required this.telp,
    required this.foto,
    required this.createdAt,
    required this.updateAt,
  });
  int idPenjual;
  String nama;
  String nik;
  String alamat;
  String telp;
  String foto;
  String createdAt;
  String updateAt;

  factory Petani.fromJson(Map<String, dynamic> json) => Petani(
        idPenjual: json["id_penjual"],
        nama: json["nama"].toString(),
        nik: json["nik"].toString(),
        alamat: json["alamat"].toString(),
        telp: json["telp"].toString(),
        foto: json["foto"].toString(),
        createdAt: json["createdAt"].toString(),
        updateAt: json["updateAt"].toString(),
      );
}
