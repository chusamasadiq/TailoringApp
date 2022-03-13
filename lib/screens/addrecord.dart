import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tailoringapp/screens/sizebox.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({Key? key}) : super(key: key);
  static String id = 'AddNewRecordScreen';

  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  String? name;
  String? regno;
  String? department;
  final _firestore = FirebaseFirestore.instance;
  dynamic _radioValue1;
  dynamic _handleRadioValueChange1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Tailoring App'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                  children: [
                    // Image.asset(
                    //   'assets/images/Security.png',
                    //   fit: BoxFit.cover,
                    //   scale: 5,
                    // ),
                    Text(
                      'Add New Dress Record',
                      style: TextStyle(fontSize: 25),
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'نام',
                        labelText: 'نام',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'فون نمبر',
                        labelText: 'فون نمبر',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'قمیض',
                        labelText: 'قمیض',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        regno = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'تیرا',
                        labelText: 'تیرا',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'بازو',
                        labelText: 'بازو',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'چھاتی',
                        labelText: 'چھاتی',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'کالر',
                        labelText: 'کالر',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'گھیرا',
                        labelText: 'گھیرا',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),
                    CustomeSizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'شلوار',
                        labelText: 'شلوار',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        department = value;
                      },
                    ),

              CustomeSizedBox(height: 20),
              new Text(
                'Lion is :',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )
              ,
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Carnivore',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Herbivore',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Radio(
                      value: 2,
                      groupValue: _radioValue1,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Omnivore',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                ]
              ),

                    CustomeSizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 320,
                      child: ElevatedButton(
                          onPressed: () {
                            _firestore.collection('student').add({
                              'Name': name,
                              'RegNo': regno,
                              'Department': department
                            });
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Student Record has been added Successfully!')));
                          },
                          child: Text('Add Dress Record')),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ]
              ),
            )));
  }
}

