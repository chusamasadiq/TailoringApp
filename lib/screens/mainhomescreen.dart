import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailoringapp/screens/addrecord.dart';
import 'package:tailoringapp/screens/sizebox.dart';

import 'drawer.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);
  static String id = 'MainHomeScreen';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String? name;
  String? regno;
  String? department;
  final _firestore = FirebaseFirestore.instance;

  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();

  final CollectionReference _students =
  FirebaseFirestore.instance.collection('student');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {

    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['Name'];
      _regController.text = documentSnapshot['RegNo'].toString();
      _deptController.text = documentSnapshot['Department'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _regController,
                  decoration: const InputDecoration(
                    labelText: 'RegNo',
                  ),
                ),
                TextField(
                  controller: _deptController,
                  decoration: const InputDecoration(labelText: 'Department'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final String? reg = _regController.text;
                    final String? dept=_deptController.text;
                    if (name != null && reg != null && dept!=null) {

                      // Update the product
                      await _students
                          .doc(documentSnapshot!.id)
                          .update({"Name": name, "RegNo": reg,"Department":dept});


                      // Clear the text fields
                      _nameController.text = '';
                      _regController.text = '';
                      _deptController.text='';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String studentId) async {
    await _students.doc(studentId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Student Record has been deleted Successfully!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tailoring App'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            CustomeSizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                Navigator.pushNamed(context, AddRecord.id);
              },
              label: Text('Add New Dress Record'),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('student').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final List<DocumentSnapshot> students =
                          snapshot.data!.docs;

                      return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

                                return Card(
                                  child: ListTile(
                                    title: Text(documentSnapshot['Name'] +
                                        "\n" +
                                        documentSnapshot['RegNo']),
                                    subtitle: Text(
                                        documentSnapshot['Department']),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          // Press this button to edit a single product
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              _createOrUpdate(documentSnapshot);
                                            },
                                          ),
                                          // This icon button is used to delete a single product
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {
                                              _deleteProduct(documentSnapshot.id);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          )
                      );
                    } else {
                      return Text('Error');
                    }
                  }),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
