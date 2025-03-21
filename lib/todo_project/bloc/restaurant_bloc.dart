import 'package:reservation_system/models/class/restaurant.dart';
import 'package:reservation_system/services/restaurant_service.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_even.dart';
import 'package:reservation_system/todo_project/bloc/restaurant_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantBloc extends Bloc<RestaurantEven, RestaurantState> {
  RestaurantBloc() : super(RestaurantInit()) {
    on<RestaurantRefresh>((event, emit) async {
      emit(RestaurantLoading());
      List<Restaurant> rest = await RestaurantService.getRestaurantFromServer();
      emit(RestaurantRefreshedSuccess(restaurantServer: rest));
    });

    on<RestaurantCreate>((event, emit) async {
      final name = event.nameRestaurant;
      final address = event.address;
      final image = event.image;
      await RestaurantService.createNewRestaurant(
        nameRestaurant: name,
        address: address,
        image: image,
      );
      add(RestaurantRefresh());
    });

    on<RestaurantDelete>((event, emit) async {
      await RestaurantService.deleteRestaurant(id: event.id);
      add(RestaurantRefresh());
    });
  }
}
