import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/screen/home.dart';
import 'package:rshttk/widgets/CustomButon.dart';
import 'package:rshttk/widgets/castmar_text_field.dart';

class Deliver extends StatefulWidget {
  const Deliver({Key? key}) : super(key: key);

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> with Crud {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _dlvController = TextEditingController();

  Future<void> _addNotes() async {
    if (_formKey.currentState!.validate()) {
      var response = await postRequest(
        linkAddNotes,
        {
          "user_name": _titleController.text,
          "user_addres": _contentController.text,
          "ph_id": _phController.text,
          "ph_addres": _dlvController.text,
        },
      );
      if (response?['status'] == "success") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: const Color(0xFF247ABF),
        title: const Text(
          'Delivery',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                hintText: 'Full Name',
                myController: _titleController,
                valid: (value) {
                  return validInput(value!, 3, 50);
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                myController: _contentController,
                hintText: 'Address',
                valid: (value) {
                  return validInput(value!, 3, 50);
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _phController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return validInput(value!, 1, 50);
                },
                decoration: InputDecoration(
                  hintText: 'ID Pharmacy',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE3F1FC),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                myController: _dlvController,
                hintText: 'Address Pharmacy',
                valid: (value) {
                  return validInput(value!, 1, 50);
                },
              ),
              const SizedBox(height: 15),
              CustomButon(
                onPressed: () async {
                  await _addNotes();
                },
                text: 'Order New',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    " الخاص بصيدلية ID لازم تدخل ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
