import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // add appointment to user's appointment list
  Future<void> addAppointment(int doctorId, int clinicId, DateTime date) async {
    try {
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .add({
        'doctorId': doctorId,
        'clinicId': clinicId,
        'date': date,
        'status': true,
      });
    } catch (e) {
      throw e;
    }
  }

  // get status true schedule from user's appointment list
  Future<QuerySnapshot> getUpcomingAppointments() async {
    try {
      return await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .where('status', isEqualTo: true)
          .get();
    } catch (e) {
      throw e;
    }
  }

  // get status false schedule from user's appointment list
  Future<QuerySnapshot> getCompletedAppointments() async {
    try {
      return await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .collection('appointments')
          .where('status', isEqualTo: false)
          .get();
    } catch (e) {
      throw e;
    }
  }
}
