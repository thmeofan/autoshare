import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/car_cubit/cars_cubit.dart';
import '../../../data/model/car_model.dart';

class SellScreen extends StatefulWidget {
  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _photoPath;
  late String _name;
  late double _price;
  late String _gearType;
  late int _year;
  late int _horsepower;
  late String _color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _photoPath = pickedFile.path;
                    });
                  }
                },
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: _photoPath != null
                      ? Image.file(File(_photoPath), fit: BoxFit.cover)
                      : Center(
                          child: Icon(Icons.add_a_photo, size: 48.0),
                        ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gear Type',
                ),
                value: _gearType,
                items: ['Automatic', 'Manual'].map((gearType) {
                  return DropdownMenuItem<String>(
                    value: gearType.toLowerCase(),
                    child: Text(gearType),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gear type';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _gearType = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Year',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a year';
                  }
                  return null;
                },
                onSaved: (value) {
                  _year = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Horsepower',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the horsepower';
                  }
                  return null;
                },
                onSaved: (value) {
                  _horsepower = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Color',
                ),
                value: _color,
                items: [
                  'Red',
                  'Orange',
                  'Yellow',
                  'Green',
                  'Blue',
                  'Purple',
                  'Pink',
                  'Brown',
                  'Gray',
                  'Black',
                  'White',
                ].map((color) {
                  return DropdownMenuItem<String>(
                    value: color.toLowerCase(),
                    child: Text(color),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a color';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _color = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final car = Car(
                      id: UniqueKey().toString(),
                      type: 'sell',
                      photoPath: _photoPath,
                      name: _name,
                      price: _price,
                      gearType: _gearType,
                      year: _year,
                      horsepower: _horsepower,
                      color: _color,
                    );
                    context.read<CarsCubit>().addCar(car);
                    Navigator.pop(context);
                  }
                },
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
