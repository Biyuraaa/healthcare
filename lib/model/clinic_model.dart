class ClinicModel {
  final int id;
  final String name;
  final String address;

  ClinicModel({
    required this.id,
    required this.name,
    required this.address,
  });

  // get clinics data by id
  static ClinicModel getClinicById(int id) {
    return clinicsData.firstWhere((clinic) => clinic.id == id);
  }

  static final List<ClinicModel> clinicsData = [
    ClinicModel(
      id: 1,
      name: 'Klinik Sehat Medika',
      address: 'Jl. Diponegoro No.15, Tegalsari, Kota SBY, Jawa Timur 60265',
    ),
    ClinicModel(
      id: 2,
      name: 'Klinik Kasih Ibu',
      address: 'Jl. Ahmad Yani No.20, Wonokromo, Kota SBY, Jawa Timur 60244',
    ),
    ClinicModel(
      id: 3,
      name: 'Klinik Pratama',
      address: 'Jl. Pemuda No.30, Gubeng, Kota SBY, Jawa Timur 60272',
    ),
    ClinicModel(
      id: 4,
      name: 'Klinik Utama',
      address: 'Jl. Basuki Rahmat No.40, Tegalsari, Kota SBY, Jawa Timur 60271',
    ),
  ];
}
