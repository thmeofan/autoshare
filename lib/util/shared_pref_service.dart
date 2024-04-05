import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../data/model/car_model.dart';

class SharedPreferencesService {
  static const String _carsKey = 'cars';

  Future<void> saveCars(List<Car> cars) async {
    final prefs = await SharedPreferences.getInstance();
    final carsJson = jsonEncode(cars.map((car) => car.toJson()).toList());
    await prefs.setString(_carsKey, carsJson);
  }

  Future<List<Car>> getCars() async {
    final prefs = await SharedPreferences.getInstance();
    final carsJson = prefs.getString(_carsKey);
    if (carsJson != null) {
      final List<dynamic> carsList = jsonDecode(carsJson);
      return carsList.map((json) => Car.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> deleteCar(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final cars = await getCars();
    final updatedCars = cars.where((car) => car.id != id).toList();
    final carsJson =
        jsonEncode(updatedCars.map((car) => car.toJson()).toList());
    await prefs.setString(_carsKey, carsJson);
  }
}
