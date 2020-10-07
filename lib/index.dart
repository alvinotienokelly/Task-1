import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final _formKey = GlobalKey<FormState>();
  String sentence;
  int length;

  Future _result() async {
    if (sentence.toString().length <= length) {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Result",
                style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              ),
              content: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  sentence,
                  style: GoogleFonts.quicksand(),
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: GoogleFonts.quicksand(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          });
    } else if (sentence.toString().length > length) {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Result",
                style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
              ),
              content: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  sentence.substring(0, length).trimRight(),
                  style: GoogleFonts.quicksand(),
                ),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: GoogleFonts.quicksand(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    sentence = value;
                  },
                  decoration: InputDecoration(labelText: 'Enter sentence'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a sentence';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    length = int.parse(value);
                  },
                  decoration: InputDecoration(labelText: 'Enter Length'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter desired length';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(left: 30, right: 30),
                child: ButtonTheme(
                  height: 40,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'RESULT',
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _result();
                        } else {}
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
