import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_event.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_state.dart';
import 'package:reservation_system/component/button/ui_button.dart';
import 'package:reservation_system/models/class/reservation.dart';
import 'package:reservation_system/presentation/review_restaurant/component/comment.dart';
import 'package:reservation_system/presentation/review_restaurant/component/rating_bar.dart';
import 'package:reservation_system/presentation/review_restaurant/component/upload_photo.dart';
import 'package:reservation_system/routes/route_named.dart';

class ReviewRestaurantScreen extends StatefulWidget {
  final String? id;
  const ReviewRestaurantScreen({super.key, required this.id});

  @override
  State<ReviewRestaurantScreen> createState() => _ReviewRestaurantScreenState();
}

class _ReviewRestaurantScreenState extends State<ReviewRestaurantScreen> {
  late Reservation reservationData;
  final _formKey = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReviewRestaurantBloc>(
      context,
    ).add(FetchReservationRestaurant(restaurantId: widget.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6EFE8),
      appBar: AppBar(
        backgroundColor: Color(0xffF6EFE8),
        centerTitle: true,
        title: Text(
          'Review Restaurant',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff483332),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routenamed.reservationDetail,
              arguments: {"reservationId": widget.id},
            );
          },
        ),
      ),
      body: BlocBuilder<ReviewRestaurantBloc, ReviewRestaurantState>(
        builder: (context, state) {
          if (state is ReviewRestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReviewRestaurantSuccess) {
            reservationData = state.reservation!;
            return SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: _buildBody(
                    context,
                    reservationData,
                    commentController,
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text("Error loading data"));
          }
        },
      ),
    );
  }
}

Widget _buildBody(
  BuildContext context,
  Reservation reservation,
  TextEditingController commentController,
) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "#${reservation.id.toString()}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff483332),
            ),
          ),
        ),
        Container(
          width: 327,
          height: 155,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.network(
            reservation.restaurantInfo?.image ?? '',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(
            reservation.restaurantInfo?.nameRestaurant ?? "",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff483332),
            ),
          ),
        ),
        SizedBox(height: 10),
        RatingBar(rating: 5),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewComment(commentController: commentController),
            SizedBox(height: 10),
            UploadPhoto(),
            SizedBox(height: 10),
          ],
        ),
        CustomButton(
          text: "SEND",
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Review submitted successfully!")),
            );
          },
        ),
      ],
    ),
  );
}
