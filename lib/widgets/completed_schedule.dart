// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthcare/model/clinic_model.dart';
import 'package:healthcare/model/dokter_model.dart';
import 'package:healthcare/services/authentication/booking_service.dart';

class CompletedSchedule extends StatefulWidget {
  const CompletedSchedule({Key? key}) : super(key: key);

  @override
  _CompletedScheduleState createState() => _CompletedScheduleState();
}

class _CompletedScheduleState extends State<CompletedSchedule> {
  int? _rating1;
  String _review1 = '';
  int? _rating2;
  String _review2 = '';

  BookingService _bookingService = BookingService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 0),
          FutureBuilder(
              future: _bookingService.getCompletedAppointments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var completedAppointments = snapshot.data!.docs;

                if (completedAppointments.isEmpty) {
                  return const Center(
                    child: Text("No Completed Appointments"),
                  );
                }

                return ListView.builder(
                    itemCount: completedAppointments.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = completedAppointments[index].data()
                          as Map<String, dynamic>;

                      DokterModel dokter =
                          DokterModel.getDokterById(data['doctorId']);
                      ClinicModel clinic =
                          ClinicModel.getClinicById(data['clinicId']);

                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  dokter.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(dokter.specializations),
                                    Text(clinic.name),
                                  ],
                                ),
                                trailing: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      "assets/images/${dokter.image}"),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                  height: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "01/03/2024",
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "11:00 AM",
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors
                                              .green, // Changed color based on status
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Confirmed", // Changed text based on status
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (_rating2 != null &&
                                  _review2
                                      .isNotEmpty) // Add condition to show review
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align content to the start
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Text(" $_rating2"),
                                        ],
                                      ),
                                      SizedBox(
                                          height:
                                              8), // Add spacing between "Your Rating" and "Your Review"
                                      Text(" $_review2"),
                                    ],
                                  ),
                                ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center the review button
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _showReviewDialog(
                                          context, _rating2, _review2,
                                          (int? rating, String review) {
                                        setState(() {
                                          _rating2 = rating;
                                          _review2 = review;
                                        });
                                      });
                                    },
                                    child: Container(
                                      width: 300,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 74, 173),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Review",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ],
      ),
    );
  }

  void _showReviewDialog(BuildContext context, int? initialRating,
      String initialReview, Function(int?, String) onReviewSubmitted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewDialog(
          initialRating: initialRating,
          initialReview: initialReview,
          onReviewSubmitted: onReviewSubmitted,
        );
      },
    );
  }
}

class ReviewDialog extends StatefulWidget {
  final Function(int, String) onReviewSubmitted;

  const ReviewDialog(
      {Key? key,
      required this.onReviewSubmitted,
      int? initialRating,
      required String initialReview})
      : super(key: key);

  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _rating = 0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Give Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Please rate this schedule:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 35,
                ),
              );
            }),
          ),
          SizedBox(height: 20), // Spacer
          TextFormField(
            controller: _reviewController,
            decoration: InputDecoration(
              labelText: 'Your review',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            widget.onReviewSubmitted(_rating, _reviewController.text);
            Navigator.of(context).pop();
          },
          child: const Text("Submit"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: CompletedSchedule(),
    ),
  ));
}
