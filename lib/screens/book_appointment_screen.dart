// ignore_for_file: library_private_types_in_public_api, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/services/authentication/booking_service.dart';
import 'package:healthcare/widgets/navbar_roots.dart';

class BookAppointmentScreen extends StatefulWidget {
  final DokterModel dokterModel;
  BookAppointmentScreen({Key? key, required this.dokterModel})
      : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  late DateTime _selectedDate;
  int _selectedPaymentIndex =
      -1; // Menyimpan indeks metode pembayaran yang dipilih
  int _selectedClinicIndex = -1; // Menyimpan indeks klinik yang dipilih
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Menginisialisasi tanggal terpilih dengan tanggal saat ini
    _selectedDate = DateTime.now();
  }

  BookingService bookingService = BookingService();

  void _bookAppointment(int doctorId, int clinicId, DateTime date) async {
    await bookingService.addAppointment(doctorId, clinicId, date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Book Appointment'),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Select Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: _selectDate,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 10),
                        Text(
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select Clinic:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.dokterModel.clinic.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 0,
                      );
                    },
                    itemBuilder: (context, index) {
                      final clinic = widget.dokterModel.clinic[index];
                      return ListTile(
                        title: Text(clinic.name),
                        onTap: () {
                          setState(() {
                            _selectedClinicIndex = index;
                          });
                        },
                        trailing: _selectedClinicIndex == index
                            ? Icon(Icons.check, color: Colors.green)
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select Payment Method:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: paymentMethods.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 0,
                      );
                    },
                    itemBuilder: (context, index) {
                      final paymentMethod = paymentMethods[index];
                      return ListTile(
                        leading: Image.asset(
                          paymentMethod['image']!,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(paymentMethod['name']!),
                        subtitle: Text(paymentMethod['amount']!),
                        onTap: () {
                          setState(() {
                            _selectedPaymentIndex = index;
                          });
                        },
                        trailing: _selectedPaymentIndex == index
                            ? Icon(Icons.check, color: Colors.green)
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_selectedClinicIndex == -1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a clinic'),
                            ),
                          );
                          return;
                        }
                        if (_selectedPaymentIndex == -1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a payment method'),
                            ),
                          );
                          return;
                        }
                        _bookAppointment(
                            widget.dokterModel.id,
                            widget.dokterModel.clinic[_selectedClinicIndex].id,
                            _selectedDate);
                        _showBookingSuccessDialog(); // Panggil fungsi untuk menampilkan dialog
                      },
                      child: Text(
                        'Book Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Fungsi untuk menampilkan dialog booking berhasil
  Future<void> _showBookingSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Your appointment has been booked successfully.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavBarRoots(),
                  ),
                ); // Tutup dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

final List<Map<String, String>> paymentMethods = [
  {
    'name': 'Cash',
    'image': 'assets/images/Cash.jpg',
    'amount': 'Biaya: Rp 100.000',
  },
  {
    'name': 'Transfer Bank',
    'image': 'assets/images/tf.png',
    'amount': 'Biaya: Rp 100.000',
  },
  {
    'name': 'Dana',
    'image': 'assets/images/dana.jpeg',
    'amount': 'Biaya: Rp 100.000',
  },
  {
    'name': 'Shopeepay',
    'image': 'assets/images/spay.png',
    'amount': 'Biaya: Rp 100.000',
  },
  {
    'name': 'Gopay',
    'image': 'assets/images/gopay.png',
    'amount': 'Biaya: Rp 100.000',
  },
  {
    'name': 'OVO',
    'image': 'assets/images/ovo.png',
    'amount': 'Biaya: Rp 100.000',
  },
];

final List<String> clinics = [
  'Klinik Medical Center',
  'Klinik Tabita',
  'Klinik Surya Medika',
  'Klinik Pratama',
  'Klinik Tong Fang',
];
