import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'package:grouped_buttons/grouped_buttons.dart';

DateTime selectedDate = DateTime
    .now(); //set date to current date since requests can only be made today or in the future

final textEditController = TextEditingController();

void main() => runApp(CustomVolunteerForm());

class CustomVolunteerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

//
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> saveRequest() async {
//var parseObject = ParseObject('Requests');

//ParseObject('Requests')..set('requesterName', 'requesterName-test');
    // final request = ParseObject('Requests')
    //   ..set('requesterName', 'requesterName-test');
    //await parseObject.save();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.contact_page_outlined),
                hintText: 'Your First Name'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your First Name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.contact_page_outlined),
                hintText: 'Your Last Name'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Last Name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.phone), hintText: 'Your Phone Number'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Phone #';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.email_outlined),
                hintText: 'Your Email Address'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first Name';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black),
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Your Birth Date'),
              ),
            ],
          ),
          SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.contact_page_outlined),
                hintText: 'Emergency Contact Name'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first Name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.phone), hintText: 'Emergency Contact Phone #'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first Name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.note_add_sharp),
                hintText: 'Emergency Contact Relationship'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first Name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Center(
            child: Text('Select your languages',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          CheckboxGroup(labels: <String>[
            "Chinese - Putonghua (Mandarin)",
            "Chinese - Cantonese",
            "English Only",
            "Spanish",
            "Vietnamese"
          ]),
          SizedBox(height: 10),
          Center(
            child: Text('Have you had any previous de-escalation training?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          RadioButtonGroup(labels: <String>[
            "Yes",
            "No",
          ], onSelected: (String selected) => print(selected)),
          SizedBox(height: 10),
          Center(
            child: Text('Roles',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          CheckboxGroup(labels: <String>[
            "Chaperone - let's go for a walk!",
            "Community Outreach - speak with \nthe local businesses",
            "Administrative Work",
            "Copywriting",
            "Social Media",
            "Answering calls and dispatching\nvolunteers (bilingual speakers only)"
          ]),
          SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.note_add_sharp),
                hintText: 'Other special skills/talents'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first Name';
              }
              return null;
            },
          ),


          //TODO: the covid test upload workflow


        ],
      ),
    );
  }
}
