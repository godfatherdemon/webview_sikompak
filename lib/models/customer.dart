class CustomerModel {
  String email;
  String name;
  String telephone;
  String alamat;
  // String kategoriProduk;
  String password;

  CustomerModel({
    this.email,
    this.name,
    this.telephone,
    this.alamat,
    // this.kategoriProduk,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'name': name,
      'telephone': telephone,
      'alamat': alamat,
      // 'kategori_produk': kategoriProduk,
      'password': password,
      'username': email
    });
    return map;
  }
}
