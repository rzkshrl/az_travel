class UserModel {
  String? uid;
  String? photoUrl;
  String? email;
  String? noKTP;
  String? namaLengkap;
  String? nomorTelepon;
  String? alamat;

  UserModel({
    this.uid,
    this.photoUrl,
    this.email,
    this.noKTP,
    this.namaLengkap,
    this.nomorTelepon,
    this.alamat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      photoUrl: json['photoUrl'],
      email: json['email'],
      noKTP: json['noKTP'],
      namaLengkap: json['namaLengkap'],
      nomorTelepon: json['nomorTelepon'],
      alamat: json['alamat'],
    );
  }
}
