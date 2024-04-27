class DokterModel {
  final String name;
  final String image;
  final String symptoms;
  final String specializations;
  final String description;
  final String address;

  DokterModel({
    required this.name,
    required this.image,
    required this.symptoms,
    required this.specializations,
    required this.description,
    required this.address,
  });

  static final List<DokterModel> dataDokter = [
    DokterModel(
      name: 'Dr. Abigail',
      image: "doctor1.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Akira",
      image: "doctor2.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: 'Dr. David Smith',
      image: "doctor3.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Hans Muller",
      image: "doctor4.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: 'Dr. Makmuri',
      image: "doctor5.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Dewi Indah",
      image: "doctor6.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: 'Dr. Soparter',
      image: "doctor7.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Partono",
      image: "doctor8.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: 'Dr. Sanjaya',
      image: "doctor9.jpg",
      symptoms: "Kulit & Kelamin",
      specializations: "Spesialis Kulit & Kelamin",
      description:
          'Telah berpengalaman selama 15 tahun dalam mengatasi penyakit, terutama di spesialis kulit dan kelamin',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Tom Albert",
      image: "doctor10.jpg",
      symptoms: "Mata",
      specializations: "Spesialis Mata",
      description:
          'Telah berpengalaman selama 10 tahun dalam mengatasi penyakit, terutama di spesialis mata',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: 'Dr. Indra Khasanah',
      image: "doctor11.jpg",
      symptoms: "Penyakit Dalam",
      specializations: "Spesialis Penyakit Dalam",
      description:
          'Telah berpengalaman selama 16 tahun dalam mengatasi penyakit, terutama di spesialis penyakit dalam',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
    DokterModel(
      name: "Dr. Aufa Izmi",
      image: "doctor12.jpg",
      symptoms: "THT",
      specializations: "Spesialis THT",
      description:
          'Telah berpengalaman selama 20 tahun dalam mengatasi penyakit, terutama di spesialis THT',
      address:
          "Jl. Kenjeran No.506, Kalijudan, Kec. Mulyorejo, Kota SBY, Jawa Timur  60134",
    ),
  ];
}

List<String> symptoms = [
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
  "Kulit & Kelamin",
  "Mata",
  "Penyakit Dalam",
  "THT",
];

List<String> imgs = [
  "doctor1.jpg",
  "doctor2.jpg",
  "doctor3.jpg",
  "doctor4.jpg",
  "doctor5.jpg",
  "doctor6.jpg",
  "doctor7.jpg",
  "doctor8.jpg",
  "doctor9.jpg",
  "doctor10.jpg",
  "doctor11.jpg",
  "doctor12.jpg",
];

List<String> doctors = [
  "Dr. Abigail",
  "Dr. Akira",
  "Dr. David Smith",
  "Dr. Hans Muller",
  "Dr. Makmuri",
  "Dr. Dewi Indah",
  "Dr. Soparter",
  "Dr. Partono",
  "Dr. Sanjaya",
  "Dr. Tom Albert",
  "Dr. Indra Khasanah",
  "Dr. Aufa Izmi",
];

List<String> specializations = [
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
  "Spesialis Kulit & Kelamin",
  "Spesialis Mata",
  "Spesialis Penyakit Dalam",
  "Spesialis THT",
];
