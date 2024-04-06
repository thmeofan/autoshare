import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/car_model.dart';
import '../../util/shared_pref_service.dart';

class CarsCubit extends Cubit<List<Car>> {
  final SharedPreferencesService _sharedPreferencesService;

  CarsCubit(this._sharedPreferencesService) : super([]) {
    _loadCars();
  }

  List<Car>? _originalCars;

  void _loadCars() async {
    final cars = await _getCars();
    _originalCars = List.from(cars);
    emit(cars);
  }

  Future<List<Car>> _getCars() async {
    return await _sharedPreferencesService.getCars();
  }

  void getCars() {
    _loadCars();
  }

  void addCar(Car car) async {
    final List<Car> updatedList = List.from(state)..add(car);
    emit(updatedList);
    await _sharedPreferencesService.saveCars(updatedList);
  }

  void deleteCar(String id) async {
    await _sharedPreferencesService.deleteCar(id);
    final updatedList =
        (await _getCars()).where((car) => car.id != id).toList();
    emit(updatedList);
  }

  void updateCarsList(List<Car> updatedList) async {
    emit(updatedList);
    await _sharedPreferencesService.saveCars(updatedList);
  }

  void restoreOriginalCars() async {
    if (_originalCars != null) {
      emit(_originalCars!);
      await _sharedPreferencesService.saveCars(_originalCars!);
      _sharedPreferencesService.deleteFilteredCars();
    }
  }

  void applyFilter({
    required RangeValues priceRange,
    required RangeValues yearRange,
    required String gearType,
    required String color,
  }) {
    List<Car> filteredCars = state.where((car) {
      return car.price >= priceRange.start &&
          car.price <= priceRange.end &&
          car.year >= yearRange.start.toInt() &&
          car.year <= yearRange.end.toInt() &&
          car.gearType == gearType &&
          car.color == color;
    }).toList();

    emit(filteredCars);
    _sharedPreferencesService.saveFilteredCars(filteredCars);
  }
}
